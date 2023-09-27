import 'package:flutter/material.dart';
import 'package:idukaan/view/main/widgets/bottom_nav_bar_widget.dart';
import 'package:idukaan/view/util/margins.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: const Column(
            children: [],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(
        currentIndex: 0,
      ),
    );
  }
}
