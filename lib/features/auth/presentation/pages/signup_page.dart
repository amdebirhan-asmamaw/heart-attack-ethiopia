import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/localization/generated/strings.g.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/signup_cubit.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SignupCubit>(),
      child: const _SignupView(),
    );
  }
}

class _SignupView extends StatelessWidget {
  const _SignupView();

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.auth;
    // Using the new signup strings if available, otherwise fallback
    final signupT = t.signup;
    final size = MediaQuery.of(context).size;
    // Scale factor based on Figma width 360px
    final scale = size.width / 360;

    return BlocConsumer<SignupCubit, SignupState>(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Back Button
                              Padding(
                                padding: EdgeInsets.only(top: 20 * scale),
                                child: IconButton(
                                  onPressed: () => context.pop(),
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 14 * scale,
                                    color: AppColors.textBlack,
                                  ),
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                ),
                              ),

                              SizedBox(height: 35 * scale),

                              // Header
                              Text(
                                signupT.title,
                                style: TextStyle(
                                  fontSize: 24 * scale,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.loginMaroon,
                                  fontFamily: 'League Spartan',
                                ),
                              ),
                              SizedBox(height: 5 * scale),
                              Text(
                                signupT.subtitle,
                                style: TextStyle(
                                  fontSize: 16 * scale,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textBlack.withOpacity(0.5),
                                  fontFamily: 'League Spartan',
                                ),
                              ),

                              SizedBox(height: 40 * scale),

                              // Signup Inputs
                              Column(
                                children: [
                                  AuthTextField(
                                    hintText: signupT.firstName,
                                    initialValue: state.firstName.value,
                                    onChanged: context.read<SignupCubit>().firstNameChanged,
                                    scale: scale,
                                  ),
                                  SizedBox(height: 7 * scale),
                                  AuthTextField(
                                    hintText: signupT.lastName,
                                    initialValue: state.lastName.value,
                                    onChanged: context.read<SignupCubit>().lastNameChanged,
                                    scale: scale,
                                  ),
                                  SizedBox(height: 7 * scale),
                                  AuthTextField(
                                    hintText: signupT.password,
                                    initialValue: state.password.value,
                                    onChanged: context.read<SignupCubit>().passwordChanged,
                                    obscureText: true,
                                    isPasswordField: true,
                                    scale: scale,
                                  ),
                                  SizedBox(height: 7 * scale),
                                  AuthTextField(
                                    hintText: signupT.confirmPassword,
                                    initialValue: state.confirmPassword.value,
                                    onChanged: context.read<SignupCubit>().confirmPasswordChanged,
                                    obscureText: true,
                                    isPasswordField: true,
                                    scale: scale,
                                  ),
                                ],
                              ),

                              SizedBox(height: 27 * scale),

                              // Signup Button
                              AuthButton(
                                text: t.submit, // Reusing 'submit' or could use 'signupT.submit'
                                backgroundColor: AppColors.loginMaroon,
                                textColor: Colors.white,
                                isLoading: state.status == FormzSubmissionStatus.inProgress,
                                onPressed: () => context.read<SignupCubit>().submit(),
                                borderRadius: 50,
                                scale: scale,
                              ),

                              SizedBox(height: 40 * scale),

                              // OR Divider
                              Row(
                                children: [
                                  const Expanded(child: Divider(color: Colors.black, thickness: 1)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5 * scale),
                                    child: Text(
                                      t.or,
                                      style: TextStyle(
                                        fontSize: 16 * scale,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textBlack,
                                        fontFamily: 'League Spartan',
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: Divider(color: Colors.black, thickness: 1)),
                                ],
                              ),

                              SizedBox(height: 18 * scale),

                              // Social Buttons
                              AuthButton(
                                text: t.continueWithGoogle,
                                backgroundColor: AppColors.loginGrayDark,
                                textColor: AppColors.textBlack,
                                onPressed: () {},
                                borderRadius: 13,
                                scale: scale,
                                fontSize: 16,
                              ),
                              SizedBox(height: 10 * scale),
                              AuthButton(
                                text: t.continueWithApple,
                                backgroundColor: AppColors.loginGrayDark,
                                textColor: AppColors.textBlack,
                                onPressed: () {},
                                borderRadius: 13,
                                scale: scale,
                                fontSize: 16,
                              ),
                              SizedBox(height: 10 * scale),
                              AuthButton(
                                text: t.continueWithFacebook,
                                backgroundColor: AppColors.loginGrayDark,
                                textColor: AppColors.textBlack,
                                onPressed: () {},
                                borderRadius: 13,
                                scale: scale,
                                fontSize: 16,
                              ),

                              SizedBox(height: 18 * scale),

                              // Terms
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10 * scale),
                                  child: Text(
                                    t.terms,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14 * scale,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4,
                                      color: AppColors.textGrayLighter,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ),
                              ),

                              const Spacer(flex: 1),
                              
                              // Already have an account
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    signupT.alreadyHaveAccount,
                                    style: TextStyle(
                                      fontSize: 12 * scale,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textGray,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => context.pop(),
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.only(left: 4 * scale, top: 8 * scale, bottom: 8 * scale),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      t.submit, // Or 'Sign in'
                                      style: TextStyle(
                                        fontSize: 12 * scale,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.loginMaroonLight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10 * scale),
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
