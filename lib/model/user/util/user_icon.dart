import 'package:flutter/material.dart';

enum UserIcons {
  name(icon: Icons.person),
  contactNo(icon: Icons.contact_phone_outlined),
  mail(icon: Icons.mail),
  username(icon: Icons.verified_user),
  pwd(icon: Icons.password);

  const UserIcons({
    required this.icon,
  });

  final IconData icon;
}