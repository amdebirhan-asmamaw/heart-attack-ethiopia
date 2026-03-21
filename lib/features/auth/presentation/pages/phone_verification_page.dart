import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';
import 'package:heart_attack_ethiopia/core/extensions/context_extensions.dart';
import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_button.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_text_field.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _otpFocusNode = FocusNode();
  bool _showOtpSection = false;

  @override
  void initState() {
    super.initState();
    _otpController.addListener(_onOtpChanged);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  void _onOtpChanged() {
    setState(() {});
  }

  void _sendOtp() {
    if (_phoneController.text.length >= 9) {
      setState(() {
        _showOtpSection = true;
      });
      Future.delayed(const Duration(milliseconds: 100), () {
        _otpFocusNode.requestFocus();
      });
    }
  }

  void _verifyOtp() {
    if (_otpController.text.length == 6) {
      context.showAppSnackBar(context.t.strings.common.comingSoon);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.auth.phoneVerification;

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(CupertinoIcons.chevron_back, color: AppColors.primary),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 11),
              _HeaderSection(
                title: t.signInWithPhone,
                subtitle: t.enterPhoneNumber,
              ),
              const SizedBox(height: 47),
              _PhoneInputSection(
                controller: _phoneController,
                countryCode: t.countryCode,
                onSubmitted: _sendOtp,
              ),
              const SizedBox(height: 20),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: _showOtpSection
                    ? Column(
                        children: [
                          _OtpInputField(
                            controller: _otpController,
                            focusNode: _otpFocusNode,
                            onSubmitted: _verifyOtp,
                          ),
                          const SizedBox(height: 20),
                          AuthButton.primary(
                            text: t.verify,
                            onPressed: _verifyOtp,
                          ),
                          const SizedBox(height: 16),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              if (!_showOtpSection) ...[
                AuthButton.primary(
                  text: t.sendOtp,
                  onPressed: _sendOtp,
                ),
                const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}

class _PhoneInputSection extends StatelessWidget {
  const _PhoneInputSection({
    required this.controller,
    required this.countryCode,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final String countryCode;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 82,
          height: 61,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            countryCode,
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.textHint,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AuthTextField(
            controller: controller,
            hintText: '',
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            borderRadius: 10,
            contentPadding: const EdgeInsets.symmetric(horizontal: 11, vertical: 20),
            textStyle: const TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.textPrimary,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(9),
            ],
            onSubmitted: (_) => onSubmitted(),
          ),
        ),
      ],
    );
  }
}

class _OtpInputField extends StatelessWidget {
  const _OtpInputField({
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: controller,
      hintText: '',
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      borderRadius: 10,
      textAlign: TextAlign.center,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      textStyle: const TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: AppColors.textPrimary,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(6),
      ],
      onSubmitted: (_) => onSubmitted(),
    );
  }
}
