import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy static notifications matching the "3" badge count
    final notifications = [
      _NotificationItem(
        title: 'New Health Tip Available',
        message: 'Learn how to keep your heart healthy with these 5 simple daily habits.',
        timeAgo: '2h ago',
        isUnread: true,
        icon: CupertinoIcons.heart_fill,
        iconColor: const Color(0xFFD72335),
      ),
      _NotificationItem(
        title: 'Upcoming Webinar',
        message: 'Join our founders tomorrow for a live QA session about cardiovascular health in Ethiopia.',
        timeAgo: '5h ago',
        isUnread: true,
        icon: CupertinoIcons.videocam_fill,
        iconColor: const Color(0xFF2C8A23),
      ),
      _NotificationItem(
        title: 'Donation Milestone Reached!',
        message: 'Thanks to contributors like you, we passed our monthly funding goal for surgical supplies.',
        timeAgo: '1d ago',
        isUnread: true,
        icon: CupertinoIcons.gift_fill,
        iconColor: const Color(0xFFE5A93B),
      ),
      _NotificationItem(
        title: 'Welcome to Heart Attack Ethiopia',
        message: 'We are thrilled to have you here. Explore resources, read news, and join our mission.',
        timeAgo: '1w ago',
        isUnread: false,
        icon: CupertinoIcons.checkmark_seal_fill,
        iconColor: const Color(0xFF32080C),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF420C11)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF32080C),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(
          color: Color(0xFFEAE8E8),
          height: 1,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return InkWell(
            onTap: () {
               // Detail logic or mark as read logic would reside here
            },
            child: Container(
              color: item.isUnread ? const Color(0xFFFDE8EA).withValues(alpha: 0.5) : Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: item.iconColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        item.icon,
                        color: item.iconColor,
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                item.title,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: item.isUnread ? FontWeight.w600 : FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item.timeAgo,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.message,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _NotificationItem {
  _NotificationItem({
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.isUnread,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final String message;
  final String timeAgo;
  final bool isUnread;
  final IconData icon;
  final Color iconColor;
}
