import 'package:flutter/material.dart';

enum ProfileOptUtil {
  profile(icon: Icons.person_outline, name: 'Profile'),
  settings(icon: Icons.settings_outlined, name: 'Settings'),
  logout(icon: Icons.logout_outlined, name: 'Logout'),
  help(icon: Icons.help_outline, name: 'Help'),
  feedback(icon: Icons.feedback_outlined, name: 'Feedback'),
  bug(icon: Icons.bug_report_outlined, name: 'Report Bug'),
  termsAndCon(icon: Icons.checklist_outlined, name: 'Terms & Conditions'),
  policy(icon: Icons.policy_outlined, name: 'Privacy Policy'),
  lic(icon: Icons.summarize_outlined, name: 'Licenses');

  const ProfileOptUtil({
    required this.icon,
    required this.name,
  });

  final IconData icon;
  final String name;
}
