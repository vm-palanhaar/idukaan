import 'package:flutter/material.dart';
import 'package:idukaan/view/main/profile/widgets/profile/profile_info_widget.dart';
import 'package:idukaan/view/util/app_bar.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});
  static String id = '/idukaan/profile/info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Profile Info',
      ),
      body: const ProfileInfoWidget(),
    );
  }
}
