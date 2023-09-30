import 'package:flutter/material.dart';
import 'package:idukaan/view/util/app_bar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Stall/Shop(s)',
      ),
    );
  }
}
