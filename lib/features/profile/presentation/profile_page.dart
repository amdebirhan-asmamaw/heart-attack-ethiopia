import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_info_card.dart';
import 'widgets/profile_menu_group.dart';
import 'widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({required this.userEmail, super.key});

  final String? userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 100),
        children: [
          ProfileInfoCard(
            name: 'Abebe Kebede',
            email: userEmail ?? 'AbebeKebede@gmail.com',
          ),
          const SizedBox(height: 9),
          const ProfileMenuGroup(
            children: [
              ProfileMenuItem(
                icon: Icon(Icons.person_outline_rounded, color: Color(0x99333333)),
                label: 'Profile',
              ),
              ProfileMenuItem(
                icon: Icon(Icons.lock_outline_rounded, color: Color(0x99333333)),
                label: 'Password & Security',
              ),
              ProfileMenuItem(
                icon: Icon(Icons.notifications_none_rounded, color: Color(0x99333333)),
                label: 'Notification',
              ),
              ProfileMenuItem(
                icon: Icon(Icons.language_rounded, color: Color(0x99333333)),
                label: 'Language',
              ),
            ],
          ),
          const SizedBox(height: 9),
          const ProfileMenuGroup(
            children: [
              ProfileMenuItem(
                icon: Icon(CupertinoIcons.ant_fill, color: Color(0x99333333)),
                label: 'Help center',
              ),
              ProfileMenuItem(
                icon: Icon(Icons.phone_in_talk_outlined, color: Color(0x99333333)),
                label: 'Call center',
              ),
            ],
          ),
          const SizedBox(height: 9),
          const ProfileMenuGroup(
            children: [
              ProfileMenuItem(
                icon: Icon(Icons.play_circle_outline_rounded, color: Color(0x99333333)),
                label: 'Youtube',
              ),
              ProfileMenuItem(
                icon: Icon(Icons.link_rounded, color: Color(0x99333333)),
                label: 'Linkedin',
              ),
              ProfileMenuItem(
                icon: Icon(Icons.message_outlined, color: Color(0x99333333)),
                label: 'WhatsApp',
              ),
              ProfileMenuItem(
                icon: Icon(Icons.public_rounded, color: Color(0x99333333)),
                label: 'Website',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
