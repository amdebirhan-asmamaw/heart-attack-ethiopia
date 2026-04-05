import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/edit_profile_form_field.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF420C11)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Change Password',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF000000), // Pure black as seen in Figma and screenshot
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10, bottom: 40),
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const EditProfileFormField(
                label: 'New password',
                placeholder: 'e.g John',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              const EditProfileFormField(
                label: 'Confirm password',
                placeholder: 'e.g brown',
                obscureText: true,
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                   width: 140, // Expanded slightly to comfortably fit text with margins if needed, although 119px is also fine.
                   height: 40,
                   child: ElevatedButton(
                     onPressed: () {},
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xFF420C11),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(18),
                       ),
                       elevation: 0,
                       padding: EdgeInsets.zero,
                     ),
                     child: Text(
                       'Save Changes',
                       style: GoogleFonts.inter(
                         fontSize: 12,
                         fontWeight: FontWeight.w500,
                         color: Colors.white,
                         height: 1.2,
                       ),
                     ),
                   ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
