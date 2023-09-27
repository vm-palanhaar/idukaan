import 'package:flutter/material.dart';
import 'package:idukaan/view/main/widgets/bottom_nav_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: 3,
      ),
    );
  }
}
