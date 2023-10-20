import 'package:flutter/material.dart';
import 'package:idukaan/view/main/profile/util/profile_util.dart';
import 'package:idukaan/view/main/profile/widgets/profile/logout_widget.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/list_tile_row_widget.dart';

import 'profile/profile_info_screen.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const ListTileRowWidget(
                title: 'Account',
                titleBold: true,
              ),
              const Divider(),
              ListTileRowWidget(
                title: ProfileOptUtil.profile.name,
                icon: ProfileOptUtil.profile.icon,
                onTap: () {
                  Navigator.pushNamed(context, ProfileInfoScreen.id);
                },
              ),
              const Divider(),
              ListTileRowWidget(
                title: ProfileOptUtil.settings.name,
                icon: ProfileOptUtil.settings.icon,
                onTap: () {
                  //TODO: Settings screen
                },
              ),
              const Divider(),
              const LogoutWidget(),
              const Divider(),
              const ListTileRowWidget(
                title: 'Assistance',
                titleBold: true,
              ),
              const Divider(),
              ListTileRowWidget(
                title: ProfileOptUtil.feedback.name,
                icon: ProfileOptUtil.feedback.icon,
                onTap: () {
                  //TODO: Feedback screen
                },
              ),
              const Divider(),
              ListTileRowWidget(
                title: ProfileOptUtil.help.name,
                icon: ProfileOptUtil.help.icon,
                onTap: () {
                  //TODO: help screen
                  /*
                  Get list from backend based on app version
                   */
                },
              ),
              const Divider(),
              ListTileRowWidget(
                title: ProfileOptUtil.bug.name,
                icon: ProfileOptUtil.bug.icon,
                onTap: () {
                  //TODO: bug screen
                },
              ),
              const Divider(),
              const ListTileRowWidget(
                title: 'About App',
                titleBold: true,
              ),
              const Divider(),
              ListTileRowWidget(
                title: ProfileOptUtil.policy.name,
                icon: ProfileOptUtil.policy.icon,
                onTap: () {
                  //TODO: open webpage for privacy policy
                },
              ),
              const Divider(),
              ListTileRowWidget(
                title: ProfileOptUtil.termsAndCon.name,
                icon: ProfileOptUtil.termsAndCon.icon,
                onTap: () {
                  //TODO: open webpage for terms & conditions
                },
              ),
              const Divider(),
              ListTileRowWidget(
                title: ProfileOptUtil.lic.name,
                icon: ProfileOptUtil.lic.icon,
                onTap: () {
                  //TODO: navigate to app license screen
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
