import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack_ethiopia/app/resources/app_media.dart';
import 'package:heart_attack_ethiopia/core/widgets/page_system_ui.dart';
import 'package:heart_attack_ethiopia/features/auth/domain/entities/auth_session.dart';
import 'package:heart_attack_ethiopia/features/auth/domain/entities/auth_user.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/auth_cubit.dart';

class AuthSuccessPage extends StatefulWidget {
  const AuthSuccessPage({super.key});

  @override
  State<AuthSuccessPage> createState() => _AuthSuccessPageState();
}

class _AuthSuccessPageState extends State<AuthSuccessPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        final demoSession = AuthSession(
          user: const AuthUser(
            id: 'demo_user_123',
            email: 'demo@example.com',
            displayName: 'Demo User',
          ),
          accessToken: 'demo_access_token',
          signedInAt: DateTime.now(),
        );
        context.read<AuthCubit>().applySession(demoSession);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageSystemUi(
      systemNavigationBarColor: const Color(0xFFFAFAFA),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppMedia.lockImage,
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 32),
                const Text(
                  'You\'re All Set',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color(0xFF420C11),
                    height: 22 / 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
