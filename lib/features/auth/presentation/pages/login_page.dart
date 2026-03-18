import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../app/resources/app_media.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/localization/generated/strings.g.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.auth;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure &&
            state.errorMessage != null) {
          context.showAppSnackBar(state.errorMessage!);
        }

        if (state.status == FormzSubmissionStatus.success &&
            state.session != null) {
          context.read<AuthCubit>().applySession(state.session!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.loginBackground,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  // Logo (LOGO_3-removebg-preview 1)
                  // CSS: top: calc(50% - 225px / 2 - 263.5px);
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        AppMedia.onboardingLogo,
                        width: 225,
                        height: 225,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Login Inputs (Frame 1000006983)
                  // CSS: top: 273px;
                  Positioned(
                    top: 273,
                    left: 30,
                    right: 30,
                    child: Column(
                      children: [
                        _LoginTextField(
                          hintText: t.emailLabel,
                          initialValue: state.email.value,
                          onChanged: context.read<LoginCubit>().emailChanged,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 8),
                        _LoginTextField(
                          hintText: t.passwordLabel,
                          initialValue: state.password.value,
                          onChanged: context.read<LoginCubit>().passwordChanged,
                          obscureText: true,
                          isPasswordField: true,
                        ),
                      ],
                    ),
                  ),

                  // Forgot Password
                  // CSS: top: 374px;
                  Positioned(
                    top: 374,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          t.forgotPassword,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrayLight,
                            letterSpacing: -0.005,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Login Button & Create Account (Frame 512579)
                  // CSS: top: 407px;
                  Positioned(
                    top: 407,
                    left: 30,
                    right: 30,
                    child: Column(
                      children: [
                        _MainButton(
                          text: t.submit,
                          backgroundColor: AppColors.loginMaroon,
                          textColor: Colors.white,
                          isLoading: state.status == FormzSubmissionStatus.inProgress,
                          onPressed: () => context.read<LoginCubit>().submit(),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              t.dontHaveAccount,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textGray,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                t.createAccount,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.loginMaroonLight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // OR Divider (Frame 512566)
                  // CSS: top: 510px (parent top)
                  Positioned(
                    top: 510,
                    left: 30,
                    right: 30,
                    child: Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.black)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            t.or,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textBlack,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(color: Colors.black)),
                      ],
                    ),
                  ),

                  // Social Buttons (Frame 512575)
                  Positioned(
                    top: 550,
                    left: 30,
                    right: 30,
                    child: Column(
                      children: [
                        _SocialButton(
                          text: t.continueWithGoogle,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        _SocialButton(
                          text: t.continueWithApple,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        _SocialButton(
                          text: t.continueWithFacebook,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),

                  // Terms (Frame 1000007028)
                  // CSS: top: 730px;
                  Positioned(
                    bottom: 20,
                    left: 30,
                    right: 30,
                    child: Text(
                      t.terms,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                        color: AppColors.textGrayLighter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoginTextField extends StatefulWidget {
  final String hintText;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final bool isPasswordField;
  final TextInputType keyboardType;

  const _LoginTextField({
    required this.hintText,
    required this.initialValue,
    required this.onChanged,
    this.obscureText = false,
    this.isPasswordField = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<_LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<_LoginTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.loginGray,
        borderRadius: BorderRadius.circular(13),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
      child: TextFormField(
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        obscureText: _isObscured,
        keyboardType: widget.keyboardType,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textGray,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          filled: false,
          suffixIcon: widget.isPasswordField
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  child: Icon(
                    _isObscured
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 20,
                    color: AppColors.textGrayLight,
                  ),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 24,
            maxHeight: 24,
          ),
        ),
      ),
    );
  }
}

class _MainButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isLoading;

  const _MainButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.loginGrayDark,
          foregroundColor: AppColors.textBlack,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
