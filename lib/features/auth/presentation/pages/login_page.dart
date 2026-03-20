import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/resources/app_media.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/localization/generated/strings.g.dart';
import '../../../../core/router/routes.dart';
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
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.loginBackground,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: AppColors.loginBackground,
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 31 * scale),
                          child: Column(
                            children: [
                              // Logo
                              SizedBox(height: 10 * scale),
                              Center(
                                child: Image.asset(
                                  AppMedia.onboardingLogoPng,
                                  width: 210 * scale,
                                  height: 210 * scale,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Spacer(flex: 1),

                              // Login Inputs
                              Column(
                                children: [
                                  AuthTextField(
                                    hintText: t.emailLabel,
                                    initialValue: state.email.value,
                                    onChanged: context
                                        .read<LoginCubit>()
                                        .emailChanged,
                                    keyboardType: TextInputType.emailAddress,
                                    scale: scale,
                                  ),
                                  SizedBox(height: 8 * scale),
                                  AuthTextField(
                                    hintText: t.passwordLabel,
                                    initialValue: state.password.value,
                                    onChanged: context
                                        .read<LoginCubit>()
                                        .passwordChanged,
                                    obscureText: true,
                                    isPasswordField: true,
                                    scale: scale,
                                  ),
                                ],
                              ),

                              // Forgot Password
                              Center(
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8 * scale,
                                    ),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
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

                              // Login Button & Create Account
                              AuthButton(
                                text: t.submit,
                                backgroundColor: AppColors.loginMaroon,
                                textColor: Colors.white,
                                isLoading:
                                    state.status ==
                                    FormzSubmissionStatus.inProgress,
                                onPressed: () =>
                                    context.read<LoginCubit>().submit(),
                                borderRadius: 50,
                                scale: scale,
                              ),
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
                                    onPressed: () =>
                                        context.push(AppRoutes.signup),
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.only(
                                        left: 4 * scale,
                                        top: 8 * scale,
                                        bottom: 8 * scale,
                                      ),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
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

                              const Spacer(flex: 1),

                              // OR Divider
                              Row(
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5 * scale,
                                    ),
                                    child: Text(
                                      t.or,
                                      style: TextStyle(
                                        fontSize: 14 * scale,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textBlack,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10 * scale),

                              // Social Buttons
                              AuthButton(
                                text: t.continueWithGoogle,
                                backgroundColor: AppColors.loginGrayDark,
                                textColor: AppColors.textBlack,
                                onPressed: () {},
                                borderRadius: 13,
                                scale: scale,
                                fontSize: 14,
                              ),
                              SizedBox(height: 8 * scale),
                              AuthButton(
                                text: t.continueWithApple,
                                backgroundColor: AppColors.loginGrayDark,
                                textColor: AppColors.textBlack,
                                onPressed: () {},
                                borderRadius: 13,
                                scale: scale,
                                fontSize: 14,
                              ),
                              SizedBox(height: 8 * scale),
                              AuthButton(
                                text: t.continueWithFacebook,
                                backgroundColor: AppColors.loginGrayDark,
                                textColor: AppColors.textBlack,
                                onPressed: () {},
                                borderRadius: 13,
                                scale: scale,
                                fontSize: 14,
                              ),

                              const Spacer(flex: 1),

                              // Terms
                              Padding(
                                padding: EdgeInsets.only(bottom: 10 * scale),
                                child: Text(
                                  t.terms,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13 * scale,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                    color: AppColors.textGrayLighter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
