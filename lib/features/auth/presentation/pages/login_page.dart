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
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';

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
    final size = MediaQuery.of(context).size;
    // Scale factor based on Figma width 360px
    final scale = size.width / 360;

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
              height: size.height > 798 * scale ? size.height : 798 * scale,
              width: size.width,
              child: Stack(
                children: [
                  // Logo (LOGO_3-removebg-preview 1)
                  // CSS: top: 23px approx; width: 225px; height: 225px;
                  Positioned(
                    top: 23 * scale,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        AppMedia.onboardingLogo,
                        width: 225 * scale,
                        height: 225 * scale,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Login Inputs (Frame 1000006983)
                  // CSS: top: 273px; width: 294px; gap: 8px;
                  Positioned(
                    top: 273 * scale,
                    left: 33 * scale,
                    right: 33 * scale,
                    child: Column(
                      children: [
                        AuthTextField(
                          hintText: t.emailLabel,
                          initialValue: state.email.value,
                          onChanged: context.read<LoginCubit>().emailChanged,
                          keyboardType: TextInputType.emailAddress,
                          scale: scale,
                        ),
                        SizedBox(height: 8 * scale),
                        AuthTextField(
                          hintText: t.passwordLabel,
                          initialValue: state.password.value,
                          onChanged: context.read<LoginCubit>().passwordChanged,
                          obscureText: true,
                          isPasswordField: true,
                          scale: scale,
                        ),
                      ],
                    ),
                  ),

                  // Forgot Password
                  // CSS: top: 374px; font-size: 12px; color: #999999;
                  Positioned(
                    top: 374 * scale,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          t.forgotPassword,
                          style: TextStyle(
                            fontSize: 12 * scale,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrayLight,
                            letterSpacing: -0.005,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Login Button & Create Account (Frame 512579)
                  // CSS: top: 407px; height: 65px;
                  Positioned(
                    top: 407 * scale,
                    left: 31 * scale,
                    right: 31 * scale,
                    child: Column(
                      children: [
                        AuthButton(
                          text: t.submit,
                          backgroundColor: AppColors.loginMaroon,
                          textColor: Colors.white,
                          isLoading: state.status == FormzSubmissionStatus.inProgress,
                          onPressed: () => context.read<LoginCubit>().submit(),
                          borderRadius: 50,
                          scale: scale,
                        ),
                        SizedBox(height: 0 * scale), // CSS uses flex layout, gap handled by height of frame
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              t.dontHaveAccount,
                              style: TextStyle(
                                fontSize: 12 * scale,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textGray,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: const EdgeInsets.only(left: 4),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                t.createAccount,
                                style: TextStyle(
                                  fontSize: 12 * scale,
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
                  // CSS: top: 510px; width: 297px; gap: 5px;
                  Positioned(
                    top: 510 * scale,
                    left: 31 * scale,
                    right: 31 * scale,
                    child: Row(
                      children: [
                        Expanded(child: Divider(color: Colors.black, thickness: 1 * scale)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5 * scale),
                          child: Text(
                            t.or,
                            style: TextStyle(
                              fontSize: 16 * scale,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textBlack,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.black, thickness: 1 * scale)),
                      ],
                    ),
                  ),

                  // Social Buttons (Frame 512575)
                  // CSS: top: 560px approx; gap: 10px;
                  Positioned(
                    top: 560 * scale,
                    left: 31 * scale,
                    right: 31 * scale,
                    child: Column(
                      children: [
                        AuthButton(
                          text: t.continueWithGoogle,
                          backgroundColor: AppColors.loginGrayDark,
                          textColor: AppColors.textBlack,
                          onPressed: () {},
                          borderRadius: 13,
                          scale: scale,
                        ),
                        SizedBox(height: 10 * scale),
                        AuthButton(
                          text: t.continueWithApple,
                          backgroundColor: AppColors.loginGrayDark,
                          textColor: AppColors.textBlack,
                          onPressed: () {},
                          borderRadius: 13,
                          scale: scale,
                        ),
                        SizedBox(height: 10 * scale),
                        AuthButton(
                          text: t.continueWithFacebook,
                          backgroundColor: AppColors.loginGrayDark,
                          textColor: AppColors.textBlack,
                          onPressed: () {},
                          borderRadius: 13,
                          scale: scale,
                        ),
                      ],
                    ),
                  ),

                  // Terms (Frame 1000007028)
                  // CSS: top: 730px; width: 294px; color: #cccccc;
                  Positioned(
                    top: 730 * scale,
                    left: 33 * scale,
                    right: 33 * scale,
                    child: Text(
                      t.terms,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14 * scale,
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
