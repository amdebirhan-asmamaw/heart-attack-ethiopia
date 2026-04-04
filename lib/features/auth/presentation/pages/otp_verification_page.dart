import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_attack_ethiopia/core/router/routes.dart';
import 'package:heart_attack_ethiopia/core/widgets/page_system_ui.dart';
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
    if (_otp.length == 4) {
      context.pushReplacement(AppRoutes.authSuccess);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageSystemUi(
      systemNavigationBarColor: const Color(0xFFFAFAFA),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFAFAFA),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(CupertinoIcons.chevron_back, color: Color(0xFF420C11)),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 31),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    'We Sent You 4 Digit Code',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF420C11),
                      height: 22 / 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Write The Code We Sent',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000).withValues(alpha: 0.5),
                      height: 15 / 16,
                    ),
                  ),
                  const SizedBox(height: 59),
                  OTPTextField(
                    controller: _otpController,
                    length: 4,
                    width: MediaQuery.of(context).size.width - 62,
                    fieldWidth: 65,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFF000000),
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceBetween,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 10,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: const Color(0xFFF2F2F2),
                      borderColor: Colors.transparent,
                      enabledBorderColor: Colors.transparent,
                      focusBorderColor: const Color(0xFF420C11),
                    ),
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
                  const SizedBox(height: 16),
                  Text(
                    'Resend OTP',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000).withValues(alpha: 0.5),
                      height: 15 / 16,
                    ),
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF420C11),
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(45),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0,
                    ),
                    onPressed: _otp.length == 4 ? _verifyOtp : null,
                    child: const Text(
                      'Verify',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: -0.005,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
