import 'package:flutter/material.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: const Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
