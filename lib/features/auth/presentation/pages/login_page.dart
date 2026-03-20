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
    final t = context.t.strings.auth;

    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.errorMessage != current.errorMessage ||
          previous.session != current.session,
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
                AuthTermsSection(text: t.terms),
              ],
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
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.auth;
    final cubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.email != current.email ||
          previous.password != current.password ||
          previous.isPasswordObscured != current.isPasswordObscured ||
          previous.status != current.status,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthTextField(
              controller: emailController,
              hintText: t.emailLabel,
              onChanged: cubit.emailChanged,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              errorText: state.emailError,
            ),
            const SizedBox(height: 12),
            AuthTextField(
              controller: passwordController,
              hintText: t.passwordLabel,
              onChanged: cubit.passwordChanged,
              obscureText: state.isPasswordObscured,
              onToggleVisibility: cubit.togglePasswordVisibility,
              textInputAction: TextInputAction.done,
              errorText: state.passwordError,
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
                  t.forgotPassword,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrayLight,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AuthButton.primary(
              text: t.submit,
              onPressed: cubit.submit,
              isLoading: state.status == FormzSubmissionStatus.inProgress,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(''),
                Text(
                  t.dontHaveAccount,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGray,
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
        );
      },
    );
  }
}

class AuthSocialSection extends StatelessWidget {
  const AuthSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.auth;
    final socialLabels = [
      t.continueWithGoogle,
      t.continueWithApple,
      t.continueWithFacebook,
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
        for (final label in socialLabels) ...[
          AuthButton.secondary(text: label, onPressed: () {}),
          if (label != socialLabels.last) const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class AuthTermsSection extends StatelessWidget {
  const AuthTermsSection({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.3,
        color: AppColors.textGrayLighter,
      ),
    );
  }
}
