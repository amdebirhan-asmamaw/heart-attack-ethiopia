import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';
import 'package:heart_attack_ethiopia/core/di/injection.dart';
import 'package:heart_attack_ethiopia/core/extensions/context_extensions.dart';
import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/signup_cubit.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/pages/login_page.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_button.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_text_field.dart';

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

class _SignupView extends StatefulWidget {
  const _SignupView();

  @override
  State<_SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<_SignupView> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    final state = context.read<SignupCubit>().state;
    _firstNameController = TextEditingController(text: state.firstName.value);
    _lastNameController = TextEditingController(text: state.lastName.value);
    _passwordController = TextEditingController(text: state.password.value);
    _confirmPasswordController = TextEditingController(
      text: state.confirmPassword.value,
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.auth;
    final signupT = t.signup;
    final commonT = context.t.strings.common;

    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.errorMessage != current.errorMessage ||
          previous.session != current.session,
      listener: (context, state) {
        _syncController(_firstNameController, state.firstName.value);
        _syncController(_lastNameController, state.lastName.value);
        _syncController(_passwordController, state.password.value);
        _syncController(
          _confirmPasswordController,
          state.confirmPassword.value,
        );

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
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          surfaceTintColor: Colors.transparent,
          elevation: 0,

          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(CupertinoIcons.chevron_back, color: AppColors.primary),
          ),
        ),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _SignupHeaderSection(
                  title: signupT.title,
                  subtitle: signupT.subtitle,
                ),
                const SizedBox(height: 28),
                _SignupFormSection(
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
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
                const SizedBox(height: 16),
                _SignupFooterSection(
                  prompt: signupT.alreadyHaveAccount,
                  actionLabel: t.submit,
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

class _SignupHeaderSection extends StatelessWidget {
  const _SignupHeaderSection({required this.title, required this.subtitle});

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
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
            fontFamily: 'League Spartan',
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
            fontFamily: 'League Spartan',
          ),
        ),
      ],
    );
  }
}

class _SignupFormSection extends StatelessWidget {
  const _SignupFormSection({
    required this.firstNameController,
    required this.lastNameController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocSelector<SignupCubit, SignupState, String?>(
          selector: (state) => state.firstNameError,
          builder: (context, firstNameError) {
            final signupT = context.t.strings.auth.signup;
            return AuthTextField(
              controller: firstNameController,
              hintText: signupT.firstName,
              onChanged: cubit.firstNameChanged,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              autofillHints: const [AutofillHints.givenName],
              errorText: firstNameError,
            );
          },
        ),
        const SizedBox(height: 12),
        BlocSelector<SignupCubit, SignupState, String?>(
          selector: (state) => state.lastNameError,
          builder: (context, lastNameError) {
            final signupT = context.t.strings.auth.signup;
            return AuthTextField(
              controller: lastNameController,
              hintText: signupT.lastName,
              onChanged: cubit.lastNameChanged,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              autofillHints: const [AutofillHints.familyName],
              errorText: lastNameError,
            );
          },
        ),
        const SizedBox(height: 12),
        BlocSelector<
          SignupCubit,
          SignupState,
          ({bool obscured, String? error})
        >(
          selector: (state) =>
              (obscured: state.isPasswordObscured, error: state.passwordError),
          builder: (context, passwordState) {
            final signupT = context.t.strings.auth.signup;
            return AuthTextField(
              controller: passwordController,
              hintText: signupT.password,
              onChanged: cubit.passwordChanged,
              obscureText: passwordState.obscured,
              onToggleVisibility: cubit.togglePasswordVisibility,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              autofillHints: const [AutofillHints.newPassword],
              errorText: passwordState.error,
            );
          },
        ),
        const SizedBox(height: 12),
        BlocSelector<
          SignupCubit,
          SignupState,
          ({bool obscured, String? error})
        >(
          selector: (state) => (
            obscured: state.isConfirmPasswordObscured,
            error: state.confirmPasswordError,
          ),
          builder: (context, confirmPasswordState) {
            final signupT = context.t.strings.auth.signup;
            return AuthTextField(
              controller: confirmPasswordController,
              hintText: signupT.confirmPassword,
              onChanged: cubit.confirmPasswordChanged,
              obscureText: confirmPasswordState.obscured,
              onToggleVisibility: cubit.toggleConfirmPasswordVisibility,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => cubit.submit(),
              autofillHints: const [AutofillHints.password],
              errorText: confirmPasswordState.error,
            );
          },
        ),
        const SizedBox(height: 20),
        BlocSelector<SignupCubit, SignupState, bool>(
          selector: (state) => state.status == FormzSubmissionStatus.inProgress,
          builder: (context, isLoading) {
            return AuthButton.primary(
              text: context.t.strings.auth.signup.submit,
              onPressed: cubit.submit,
              isLoading: isLoading,
            );
          },
        ),
      ],
    );
  }
}

class _SignupFooterSection extends StatelessWidget {
  const _SignupFooterSection({required this.prompt, required this.actionLabel});

  final String prompt;
  final String actionLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          prompt,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textHint,
          ),
        ),
        TextButton(
          onPressed: () => context.pop(),
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.only(left: 4, top: 8, bottom: 8),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            actionLabel,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
