import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:heart_attack_ethiopia/core/di/injection.dart';
import 'package:heart_attack_ethiopia/core/extensions/context_extensions.dart';
import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/core/router/routes.dart';
import 'package:heart_attack_ethiopia/core/widgets/page_system_ui.dart';
import 'package:heart_attack_ethiopia/features/auth/domain/entities/auth_session.dart';
import 'package:heart_attack_ethiopia/features/auth/domain/entities/auth_user.dart';
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
                    const _LoginHeaderSection(),
                    const SizedBox(height: 48),
                    _LoginFormSection(
                      formKey: _formKey,
                      phoneController: _phoneController,
                      phoneFocusNode: _phoneFocusNode,
                    ),
                    const SizedBox(height: 48),
                    const AuthSocialSection(),
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

class _LoginHeaderSection extends StatelessWidget {
  const _LoginHeaderSection();

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.auth;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.title,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
            fontSize: 24,
            height: 22 / 24,
            color: Color(0xFF420C11),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          t.phoneVerification.enterPhoneNumber,
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


class _LoginFormSection extends StatefulWidget {
  const _LoginFormSection({
    required this.formKey,
    required this.phoneController,
    required this.phoneFocusNode,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final FocusNode phoneFocusNode;

  @override
  State<_LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<_LoginFormSection> {
  bool _hasEditedPhone = false;

  @override
  Widget build(BuildContext context) {
    final t = context.t.strings.auth;


    void submitForm() {
      final formState = widget.formKey.currentState;
      if (formState == null || !formState.validate()) {
        return;
      }
      // For now this will navigate to otp since the login state uses email and password wait for actual integration, but keep the cubit code alive.
      context.push(AppRoutes.otpVerification);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthTextField(
          controller: widget.phoneController,
          focusNode: widget.phoneFocusNode,
          hintText: "Phone number",
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
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => context.push(AppRoutes.resetPassword),
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF420C11),
                letterSpacing: -0.005,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        BlocSelector<LoginCubit, LoginState, bool>(
          selector: (state) => state.status == LoginSubmissionStatus.inProgress,
          builder: (context, isLoading) {
            return AuthButton.primary(
              text: t.phoneVerification.verify,
              onPressed: submitForm,
              isLoading: isLoading,
              loadingText: 'Signing in...',
            );
          },
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
            Text(
              t.dontHaveAccount,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF808080),
                 height: 20/14,
                letterSpacing: -0.005,
              ),
            ),
            TextButton(
              onPressed: () => context.push(AppRoutes.signup),
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                t.createAccount,
                  textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                  height: 20/14,
                   letterSpacing: -0.005,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Center(
          child: TextButton(
            onPressed: () {
              final demoSession = AuthSession(
                user: const AuthUser(
                  id: 'demo_user_id',
                  email: 'demo@example.com',
                  displayName: 'Demo User',
                ),
                accessToken: 'demo_token',
                signedInAt: DateTime.now(),
              );
              context.read<AuthCubit>().applySession(demoSession);
            },
            child: const Text(
              'Bypass with Demo Login',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF420C11),
                decoration: TextDecoration.underline,
              ),
            ),
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
            // If the svg asset available, use it here, otherwise just the text as in figma
               Flexible(
                 child: Text(
                   context.t.strings.auth.continueWithGoogle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                     fontFamily: 'League Spartan',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                       height: 20/16,
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
