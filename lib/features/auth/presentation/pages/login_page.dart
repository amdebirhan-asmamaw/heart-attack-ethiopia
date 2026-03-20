import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    final state = context.read<LoginCubit>().state;
    _emailController = TextEditingController(text: state.email.value);
    _passwordController = TextEditingController(text: state.password.value);
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
          previous.email != current.email ||
          previous.password != current.password ||
          previous.status != current.status ||
          previous.errorMessage != current.errorMessage ||
          previous.session != current.session,
      listener: (context, state) {
        _syncController(_emailController, state.email.value);
        _syncController(_passwordController, state.password.value);

        if (state.status == FormzSubmissionStatus.failure &&
            state.errorMessage != null) {
          context.showAppSnackBar(state.errorMessage!);
        }

        if (state.status == FormzSubmissionStatus.success &&
            state.session != null) {
          context.read<AuthCubit>().applySession(state.session!);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.loginBackground,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _LoginLogoSection(),
                const SizedBox(height: 24),
                _LoginFormSection(
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
                  onTermsTap: () => context.showAppSnackBar(commonT.comingSoon),
                  onPrivacyTap: () =>
                      context.showAppSnackBar(commonT.comingSoon),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _syncController(TextEditingController controller, String value) {
    if (controller.text == value) {
      return;
    }

    controller.value = controller.value.copyWith(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
      composing: TextRange.empty,
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
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocSelector<LoginCubit, LoginState, String?>(
          selector: (state) => state.emailError,
          builder: (context, emailError) {
            final t = context.t.strings.auth;
            return AuthTextField(
              controller: emailController,
              hintText: t.emailLabel,
              onChanged: cubit.emailChanged,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.email],
              errorText: emailError,
            );
          },
        ),
        const SizedBox(height: 12),
        BlocSelector<LoginCubit, LoginState, ({bool obscured, String? error})>(
          selector: (state) =>
              (obscured: state.isPasswordObscured, error: state.passwordError),
          builder: (context, passwordState) {
            final t = context.t.strings.auth;
            return AuthTextField(
              controller: passwordController,
              hintText: t.passwordLabel,
              onChanged: cubit.passwordChanged,
              obscureText: passwordState.obscured,
              onToggleVisibility: cubit.togglePasswordVisibility,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.password],
              onSubmitted: (_) => cubit.submit(),
              errorText: passwordState.error,
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
                color: AppColors.textBlack,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        BlocSelector<LoginCubit, LoginState, bool>(
          selector: (state) => state.status == FormzSubmissionStatus.inProgress,
          builder: (context, isLoading) {
            return AuthButton.primary(
              text: context.t.strings.auth.submit,
              onPressed: cubit.submit,
              isLoading: isLoading,
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
                color: AppColors.textBlack,
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
                  color: AppColors.loginMaroon,
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
                  color: AppColors.textBlack,
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
      color: AppColors.textBlack,
    );

    const linkStyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: AppColors.loginMaroon,
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
