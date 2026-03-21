import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';
import 'package:heart_attack_ethiopia/core/di/injection.dart';
import 'package:heart_attack_ethiopia/core/extensions/context_extensions.dart';
import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/core/router/routes.dart';
import 'package:heart_attack_ethiopia/core/utils/validators.dart';
import 'package:heart_attack_ethiopia/core/widgets/page_system_ui.dart';
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
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
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
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.status == SignupSubmissionStatus.failure &&
            state.errorMessage != null) {
          context.showAppSnackBar(state.errorMessage!);
        }

        if (state.status == SignupSubmissionStatus.success) {
          context.pushReplacement(AppRoutes.phoneInput);
        }
      },
      child: PageSystemUi(
        systemNavigationBarColor: AppColors.background,
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _SignupHeaderSection(
                      title: signupT.title,
                      subtitle: signupT.subtitle,
                    ),
                    const SizedBox(height: 28),
                    _SignupFormSection(
                      formKey: _formKey,
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
                      onTermsTap: () =>
                          context.showAppSnackBar(commonT.comingSoon),
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
        ),
      ),
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
          style: const TextStyle(
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

class _SignupFormSection extends StatefulWidget {
  const _SignupFormSection({
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<_SignupFormSection> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<_SignupFormSection> {
  bool isPasswordObscured = false;
  bool isConfirmPasswordObscured = false;
  bool _hasEditedFirstName = false;
  bool _hasEditedLastName = false;
  bool _hasEditedPassword = false;
  bool _hasEditedConfirmPassword = false;
  late final FocusNode _firstNameFocusNode;
  late final FocusNode _lastNameFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    final signupT = context.t.strings.auth.signup;

    void submitForm() {
      final formState = widget.formKey.currentState;
      if (formState == null || !formState.validate()) {
        return;
      }

      cubit.submit(
        firstName: widget.firstNameController.text,
        lastName: widget.lastNameController.text,
        password: widget.passwordController.text,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthTextField(
          controller: widget.firstNameController,
          focusNode: _firstNameFocusNode,
          hintText: signupT.firstName,
          autovalidateMode: _hasEditedFirstName
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          onChanged: (_) {
            if (_hasEditedFirstName) {
              return;
            }
            setState(() {
              _hasEditedFirstName = true;
            });
          },
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => _lastNameFocusNode.requestFocus(),
          autofillHints: const [AutofillHints.givenName],
          validator: (value) {
            if ((value?.trim() ?? '').isEmpty || value == null) {
              return 'First name is required';
            } else if (value.length < 3 || value.length > 20) {
              return 'Name must be between 3 and 20 characters';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        AuthTextField(
          controller: widget.lastNameController,
          focusNode: _lastNameFocusNode,
          hintText: signupT.lastName,
          autovalidateMode: _hasEditedLastName
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          onChanged: (_) {
            if (_hasEditedLastName) {
              return;
            }
            setState(() {
              _hasEditedLastName = true;
            });
          },
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => _passwordFocusNode.requestFocus(),
          autofillHints: const [AutofillHints.familyName],
          validator: (value) {
            if ((value?.trim() ?? '').isEmpty || value == null) {
              return 'Last name is required';
            }
            if (value.length < 3 || value.length > 20) {
              return 'Name must be between 3 and 20 characters';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        AuthTextField(
          controller: widget.passwordController,
          focusNode: _passwordFocusNode,
          hintText: signupT.password,
          autovalidateMode: _hasEditedPassword
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          onChanged: (_) {
            if (_hasEditedPassword) {
              return;
            }
            setState(() {
              _hasEditedPassword = true;
            });
          },
          obscureText: isPasswordObscured,
          onToggleVisibility: () {
            setState(() {
              isPasswordObscured = !isPasswordObscured;
            });
          },
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => _confirmPasswordFocusNode.requestFocus(),
          autofillHints: const [AutofillHints.newPassword],
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
        ),
        const SizedBox(height: 12),
        AuthTextField(
          controller: widget.confirmPasswordController,
          focusNode: _confirmPasswordFocusNode,
          hintText: signupT.confirmPassword,
          autovalidateMode: _hasEditedConfirmPassword
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          onChanged: (_) {
            if (_hasEditedConfirmPassword) {
              return;
            }
            setState(() {
              _hasEditedConfirmPassword = true;
            });
          },
          obscureText: isConfirmPasswordObscured,
          onToggleVisibility: () {
            setState(() {
              isConfirmPasswordObscured = !isConfirmPasswordObscured;
            });
          },
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => submitForm(),
          autofillHints: const [AutofillHints.password],
          validator: (value) {
            final confirmPassword = value ?? '';
            if (confirmPassword.trim().isEmpty) {
              return 'Confirm password is required';
            }
            if (confirmPassword != widget.passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        BlocSelector<SignupCubit, SignupState, bool>(
          selector: (state) =>
              state.status == SignupSubmissionStatus.inProgress,
          builder: (context, isLoading) {
            return AuthButton.primary(
              text: signupT.submit,
              onPressed: submitForm,
              isLoading: isLoading,
              loadingText: 'Creating account...',
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
