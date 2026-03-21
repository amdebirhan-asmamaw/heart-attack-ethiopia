import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';
import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_button.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_text_field.dart';

class PhoneInputPage extends StatefulWidget {
  const PhoneInputPage({super.key});

  @override
  State<PhoneInputPage> createState() => _PhoneInputPageState();
}

class _PhoneInputPageState extends State<PhoneInputPage> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _sendOtp() {
    if (_phoneController.text.length >= 9) {
      context.push('/otp-verification');
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
              AuthButton.primary(
                text: t.sendOtp,
                onPressed: _sendOtp,
              ),
              const SizedBox(height: 16),
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
