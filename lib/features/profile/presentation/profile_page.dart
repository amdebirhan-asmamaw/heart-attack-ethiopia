import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_info_card.dart';
import 'widgets/profile_menu_group.dart';
import 'widgets/profile_menu_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({required this.userEmail, super.key});

  final String? userEmail;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 100),
        children: [
          ProfileInfoCard(
            name: 'Abebe Kebede',
            email: widget.userEmail ?? 'abebekebede@gmail.com',
          ),
          const SizedBox(height: 8),
          ProfileMenuGroup(
            children: [
              const ProfileMenuItem(
                icon: Icon(Icons.person_outline_rounded, color: Color(0x99333333)),
                label: 'Edit Profile',
              ),
              const ProfileMenuItem(
                icon: Icon(Icons.lock_outline_rounded, color: Color(0x99333333)),
                label: 'Password & Security',
              ),
              ProfileMenuItem(
                icon: const Icon(Icons.notifications_none_rounded, color: Color(0x99333333)),
                label: 'Notification',
                trailing: _CustomSwitch(
                  value: _isNotificationEnabled,
                  onChanged: (val) {
                    setState(() {
                      _isNotificationEnabled = val;
                    });
                  },
                ),
              ),
              const ProfileMenuItem(
                icon: Icon(Icons.language_rounded, color: Color(0x99333333)),
                label: 'Language',
              ),
            ],
          ),
          const SizedBox(height: 8),
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
          const SizedBox(height: 8),
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

class _CustomSwitch extends StatelessWidget {
  const _CustomSwitch({required this.value, required this.onChanged});
  
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 31,
        height: 15,
        padding: const EdgeInsets.symmetric(horizontal: 2.5),
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: value
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFD72335), Color(0xFF71121C)],
                )
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFB0B0B0), Color(0xFFB0B0B0)],
                ),
        ),
        child: Container(
          width: 11,
          height: 11,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
