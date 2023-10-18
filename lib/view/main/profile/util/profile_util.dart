import 'package:flutter/material.dart';

enum ProfileOptUtil {
  profile(icon: Icons.person_outline, name: 'Profile'),
  settings(icon: Icons.settings_outlined, name: 'Settings'),
  settings1(icon: Icons.password_outlined, name: 'Update password'),
  help(icon: Icons.help_outline, name: 'Help'),
  feedback(icon: Icons.feedback_outlined, name: 'Feedback'),
  logout(icon: Icons.logout_outlined, name: 'Logout');

  const ProfileOptUtil({
    required this.icon,
    required this.name,
  });

  final IconData icon;
  final String name;
}
