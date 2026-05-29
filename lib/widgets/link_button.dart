import 'package:flutter/material.dart';
import '../utils/notification_badge.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final FaIconData icon;
  final VoidCallback onTap;
  final int notificationCount;
  final Color backgroundColor;
  final bool isPrimary;

  const LinkButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.notificationCount = 0,
    required this.backgroundColor,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final shadowColor = Colors.black.withOpacity(0.7);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          // Fake shadow (offset)
          Positioned(
            top: 6,
            left: 6,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: shadowColor,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),

          // Main button
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      FaIcon(icon, size: 26),
                      NotificationBadge(count: notificationCount),
                    ],
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isPrimary ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}