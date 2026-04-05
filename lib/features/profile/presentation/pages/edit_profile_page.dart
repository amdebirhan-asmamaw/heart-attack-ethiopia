import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/edit_profile_form_field.dart';
import '../widgets/profile_avatar_picker.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

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
          'Edit Profile',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF420C11),
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
              const ProfileAvatarPicker(),
              const SizedBox(height: 24),
              const EditProfileFormField(
                label: 'First Name',
                placeholder: 'Abebe',
              ),
              const SizedBox(height: 16),
              const EditProfileFormField(
                label: 'Last Name',
                placeholder: 'Kebede',
              ),
              const SizedBox(height: 16),
              const EditProfileFormField(
                label: 'Location',
                placeholder: 'Addis ababa',
              ),
              const SizedBox(height: 16),
              const EditProfileFormField(
                label: 'Phone number',
                placeholder: '+251954626644',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              const EditProfileFormField(
                label: 'Date of birth',
                placeholder: '24/04/1995',
                trailingIcon: Icon(Icons.calendar_today_outlined, size: 20, color: Color(0xFF333333)),
              ),
              const SizedBox(height: 16),
              const EditProfileFormField(
                label: 'Email',
                placeholder: 'abebekebede@gmail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                   width: 119,
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
