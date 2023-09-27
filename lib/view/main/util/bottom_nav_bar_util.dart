import 'package:flutter/material.dart';

enum BottomNavBarUtil {
  dashboard(
    icon: Icon(Icons.dashboard_outlined),
    label: 'Dashboard',
  ),
  business(
    icon: Icon(Icons.business),
    label: 'Business',
  ),
  shop(
    icon: Icon(Icons.storefront_outlined),
    label: 'Stall/Shop',
  ),
  profile(
    icon: Icon(Icons.person_outlined),
    label: 'Profile',
  );

  const BottomNavBarUtil({
    required this.icon,
    required this.label,
  });

  final Icon icon;
  final String label;
}
