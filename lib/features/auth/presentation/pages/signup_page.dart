import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_attack_ethiopia/core/di/injection.dart';
import 'package:heart_attack_ethiopia/core/extensions/context_extensions.dart';
import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/core/router/routes.dart';
import 'package:heart_attack_ethiopia/core/widgets/page_system_ui.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/signup_cubit.dart';
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
  late final TextEditingController _phoneController;
  late final FocusNode _phoneFocusNode;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _phoneFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        systemNavigationBarColor: const Color(0xFFFAFAFA),
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 115),
                    const _SignupHeaderSection(),
                    const SizedBox(height: 48),
                    _SignupFormSection(
                      formKey: _formKey,
                      phoneController: _phoneController,
                      phoneFocusNode: _phoneFocusNode,
                    ),
                    const SizedBox(height: 48),
                    const _SignupSocialSection(),
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
  const _SignupHeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create Account',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
            fontSize: 24,
            height: 22 / 24,
            color: Color(0xFF420C11),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Get Access To Heart-Health Support And Emergency Guidance',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 15 / 16,
            color: const Color(0xFF000000).withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}

class _SignupFormSection extends StatefulWidget {
  const _SignupFormSection({
    required this.formKey,
    required this.phoneController,
    required this.phoneFocusNode,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final FocusNode phoneFocusNode;

  @override
  State<_SignupFormSection> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<_SignupFormSection> {
  bool _hasEditedPhone = false;

  @override
  Widget build(BuildContext context) {
    void submitForm() {
      final formState = widget.formKey.currentState;
      if (formState == null || !formState.validate()) {
        return;
      }
      // For now this will navigate to otp since the login state uses email and password wait for actual integration
      context.push(AppRoutes.otpVerification);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthTextField(
          controller: widget.phoneController,
          focusNode: widget.phoneFocusNode,
          hintText: "Phone Number",
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          borderRadius: 13,
          contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 11),
          textStyle: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 20 / 16,
            color: Color(0xFF808080),
            letterSpacing: -0.005,
          ),
          autovalidateMode: _hasEditedPhone
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          onChanged: (_) {
            if (_hasEditedPhone) {
              return;
            }
            setState(() {
              _hasEditedPhone = true;
            });
          },
          onSubmitted: (_) => submitForm(),
          validator: (value) {
            final phone = value?.trim() ?? '';
            if (phone.isEmpty) {
              return 'Phone number is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        BlocSelector<SignupCubit, SignupState, bool>(
          selector: (state) => state.status == SignupSubmissionStatus.inProgress,
          builder: (context, isLoading) {
            return AuthButton.primary(
              text: 'Send OTP',
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

class _SignupSocialSection extends StatelessWidget {
  const _SignupSocialSection();

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.auth;
    final commonT = context.t.strings.common;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 119.5,
              height: 1,
              color: const Color(0xFF000000),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                t.or,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 20 / 16,
                  color: Color(0xFF252525),
                  letterSpacing: -0.005,
                ),
              ),
            ),
            Container(
              width: 119.5,
              height: 1,
              color: const Color(0xFF000000),
            ),
          ],
        ),
        const SizedBox(height: 28),
        _GoogleAuthButton(
          onPressed: () => context.showAppSnackBar(commonT.comingSoon),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Already have an account?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF808080),
                height: 20 / 14,
                letterSpacing: -0.005,
              ),
            ),
            TextButton(
              onPressed: () => context.pop(),
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                  height: 20 / 14,
                  letterSpacing: -0.005,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'By signing in, you agree to our Terms of Conditions and Privacy Policy',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.4,
            color: Color(0xFFCCCCCC),
          ),
        ),
      ],
    );
  }
}

class _GoogleAuthButton extends StatelessWidget {
  const _GoogleAuthButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        minHeight: 45,
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF252525),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          minimumSize: const Size.fromHeight(45),
          side: const BorderSide(color: Color(0xFF808080), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                context.t.strings.auth.continueWithGoogle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 20 / 16,
                  color: Color(0xFF252525),
                  letterSpacing: -0.005,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
