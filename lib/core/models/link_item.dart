import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinkItem {
  final String title;
  final FaIconData icon;
  final VoidCallback onTap;
  final int notificationCount;
  final Color color;
  final bool isPrimary;

  LinkItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.notificationCount = 0,
    required this.color,
    this.isPrimary = false,
  });
}