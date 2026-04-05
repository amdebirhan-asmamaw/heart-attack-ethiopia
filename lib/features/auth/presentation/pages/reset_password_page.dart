import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:heart_attack_ethiopia/core/widgets/page_system_ui.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_button.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/widgets/auth_text_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _contactController = TextEditingController();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Simulate reset logic then redirect user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset instructions sent!')),
      );
      context.pop();
    }
  }

  @override
  void dispose() {
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageSystemUi(
      systemNavigationBarColor: const Color(0xFFFAFAFA),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFAFAFA),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF420C11)),
            onPressed: () => context.pop(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Reset Password',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Color(0xFF420C11),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Enter your phone number or email to receive instructions on how to reset your password.',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color(0xFF000000).withValues(alpha: 0.5),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 48),
                  AuthTextField(
                    controller: _contactController,
                    hintText: "Phone number or email",
                    borderRadius: 13,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 11),
                    textStyle: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF808080),
                    ),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Contact info is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 48),
                  AuthButton.primary(
                    text: 'Send Reset Link',
                    onPressed: _submit,
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
