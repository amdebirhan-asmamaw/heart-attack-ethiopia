import 'package:flutter/material.dart';
import 'package:heart_attack_ethiopia/app/resources/app_media.dart';
import 'package:heart_attack_ethiopia/core/widgets/page_system_ui.dart';

class AuthSuccessPage extends StatelessWidget {
  const AuthSuccessPage({super.key});

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
