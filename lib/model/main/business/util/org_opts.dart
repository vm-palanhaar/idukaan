import 'package:flutter/material.dart';

enum OrgOptUtil {
  addShop(icon: Icons.add_business, name: 'Add Stall/Shop'),
  manageShops(icon: Icons.store, name: 'Manage Stall/Shop(s)'),
  hR(icon: Icons.people, name: 'Human Resource'),
  legal(icon: Icons.safety_check, name: 'Legal'),
  info(icon: Icons.info, name: 'Info'),
  sH(icon: Icons.settings, name: 'Settings and Help');

  const OrgOptUtil({
    required this.icon,
    required this.name,
  });

  final IconData icon;
  final String name;
}
