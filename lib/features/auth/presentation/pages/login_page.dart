import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:heart_attack_ethiopia/app/resources/app_media.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';
import 'package:heart_attack_ethiopia/core/constants/app_strings.dart';
import 'package:heart_attack_ethiopia/core/di/injection.dart';
import 'package:heart_attack_ethiopia/core/extensions/context_extensions.dart';
import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/core/router/routes.dart';
import 'package:heart_attack_ethiopia/core/utils/validators.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/login_cubit.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_button.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_text_field.dart';

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

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: AppStrings.demoEmail);
    _passwordController = TextEditingController(text: AppStrings.demoPassword);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commonT = context.t.strings.common;

    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.errorMessage != current.errorMessage ||
          previous.session != current.session,
      listener: (context, state) {
        if (state.status == LoginSubmissionStatus.failure &&
            state.errorMessage != null) {
          context.showAppSnackBar(state.errorMessage!);
        }

        if (state.status == LoginSubmissionStatus.success &&
            state.session != null) {
          context.read<AuthCubit>().applySession(state.session!);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _LoginLogoSection(),
                  const SizedBox(height: 24),
                  _LoginFormSection(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  const SizedBox(height: 24),
                  const AuthSocialSection(),
                  const SizedBox(height: 24),
                  AuthTermsSection(
                    prefixText: "By continuing you agree to ",
                    linkText: "Terms of Service",
                    middleText: " and ",
                    secondaryLinkText: "Privacy Policy",
                    onTermsTap: () =>
                        context.showAppSnackBar(commonT.comingSoon),
                    onPrivacyTap: () =>
                        context.showAppSnackBar(commonT.comingSoon),
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

class _LoginLogoSection extends StatelessWidget {
  const _LoginLogoSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppMedia.onboardingLogoPng,
        width: 210,
        height: 210,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _LoginFormSection extends StatelessWidget {
  const _LoginFormSection({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    void submitForm() {
      final formState = formKey.currentState;
      if (formState == null || !formState.validate()) {
        return;
      }

      cubit.submit(
        email: emailController.text,
        password: passwordController.text,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthTextField(
          controller: emailController,
          hintText: context.t.strings.auth.emailLabel,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.email],
          validator: (value) {
            final email = value?.trim() ?? '';
            if (email.isEmpty) {
              return 'Email is required';
            }
            if (!Validators.isValidEmail(email)) {
              return 'Enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        BlocSelector<LoginCubit, LoginState, bool>(
          selector: (state) => state.isPasswordObscured,
          builder: (context, isPasswordObscured) {
            return AuthTextField(
              controller: passwordController,
              hintText: context.t.strings.auth.passwordLabel,
              obscureText: isPasswordObscured,
              onToggleVisibility: cubit.togglePasswordVisibility,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.password],
              onSubmitted: (_) => submitForm(),
              validator: (value) {
                final password = value ?? '';
                if (password.trim().isEmpty) {
                  return 'Password is required';
                }
                if (!Validators.hasMinLength(password, 8)) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            );
          },
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(vertical: 8),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              context.t.strings.auth.forgotPassword,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textHint,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        BlocSelector<LoginCubit, LoginState, bool>(
          selector: (state) => state.status == LoginSubmissionStatus.inProgress,
          builder: (context, isLoading) {
            return AuthButton.primary(
              text: context.t.strings.auth.submit,
              onPressed: submitForm,
              isLoading: isLoading,
              loadingText: 'Signing in...',
            );
          },
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.t.strings.auth.dontHaveAccount,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textHint,
              ),
            ),
            TextButton(
              onPressed: () => context.push(AppRoutes.signup),
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: const EdgeInsets.only(left: 4, top: 8, bottom: 8),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                context.t.strings.auth.createAccount,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AuthSocialSection extends StatelessWidget {
  const AuthSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.auth;
    final commonT = context.t.strings.common;
    final socialActions = <({String label, VoidCallback onPressed})>[
      (
        label: t.continueWithGoogle,
        onPressed: () => context.showAppSnackBar(commonT.comingSoon),
      ),
      (
        label: t.continueWithApple,
        onPressed: () => context.showAppSnackBar(commonT.comingSoon),
      ),
      (
        label: t.continueWithFacebook,
        onPressed: () => context.showAppSnackBar(commonT.comingSoon),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: Colors.black, thickness: 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                t.or,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const Expanded(child: Divider(color: Colors.black, thickness: 1)),
          ],
        ),
        const SizedBox(height: 16),
        for (final socialAction in socialActions) ...[
          AuthButton.secondary(
            text: socialAction.label,
            onPressed: socialAction.onPressed,
          ),
          if (socialAction != socialActions.last) const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class AuthTermsSection extends StatelessWidget {
  const AuthTermsSection({
    required this.prefixText,
    required this.linkText,
    required this.middleText,
    required this.secondaryLinkText,
    required this.onTermsTap,
    required this.onPrivacyTap,
    super.key,
  });

  final String prefixText;
  final String linkText;
  final String middleText;
  final String secondaryLinkText;
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  @override
  Widget build(BuildContext context) {
    const baseStyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: AppColors.textSubtle,
    );

    const linkStyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: AppColors.textMuted,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: baseStyle,
        children: [
          TextSpan(text: prefixText),
          TextSpan(
            text: linkText,
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),
          TextSpan(text: middleText),
          TextSpan(
            text: secondaryLinkText,
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
          ),
        ],
      ),
    );
  }
}
