import 'package:flutter/material.dart';

enum IrShopOptUtil {
  inv(icon: Icons.shopping_cart, name: 'Manage Inventory'),
  anal(icon: Icons.analytics, name: 'Analytics '),
  hR(icon: Icons.people, name: 'Employees'),
  legal(icon: Icons.safety_check, name: 'Legal'),
  info(icon: Icons.info, name: 'Info'),
  sH(icon: Icons.settings, name: 'Settings and Help');

  const IrShopOptUtil({
    required this.icon,
    required this.name,
  });

  final IconData icon;
  final String name;
}
