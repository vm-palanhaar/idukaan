import 'package:flutter/material.dart';

enum UserIcon {
  name(icon: Icons.person),
  contactNo(icon: Icons.person),
  mail(icon: Icons.mail),
  username(icon: Icons.verified_user),
  pwd(icon: Icons.password);

  const UserIcon({
    required this.icon,
  });

  final IconData icon;
}