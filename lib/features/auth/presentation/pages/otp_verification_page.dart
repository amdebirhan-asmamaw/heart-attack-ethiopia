import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';
import 'package:heart_attack_ethiopia/core/extensions/context_extensions.dart';
import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _otpController = OtpFieldController();
  String _otp = '';

  void _verifyOtp() {
    if (_otp.length == 6) {
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
                title: t.enterOtp,
                subtitle: t.otpSentMessage,
              ),
              const SizedBox(height: 47),
              OTPTextField(
                controller: _otpController,
                length: 6,
                width: MediaQuery.of(context).size.width - 64,
                fieldWidth: 40,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.textPrimary,
                ),
                textFieldAlignment: MainAxisAlignment.spaceBetween,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 10,
                onChanged: (value) {
                  setState(() {
                    _otp = value;
                  });
                },
                onCompleted: (value) {
                  setState(() {
                    _otp = value;
                  });
                  _verifyOtp();
                },
              ),
              const SizedBox(height: 24),
              AuthButton.primary(
                text: t.verify,
                onPressed: _otp.length == 6 ? _verifyOtp : () {},
                isLoading: false,
              ),
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
