import 'package:flutter/material.dart';
import 'package:idukaan/view/main/widgets/bottom_nav_bar_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: 2,
      ),
    );
  }
}
