import 'package:flutter/material.dart';
import 'package:idukaan/view/main/profile/util/profile_util.dart';
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
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(ProfileOptUtil.profile.icon),
                  title: Text(ProfileOptUtil.profile.name),
                  onTap: () {},
                ),
              ),
              const Divider(),
              Card(
                child: ExpansionTile(
                  leading: Icon(ProfileOptUtil.settings.icon),
                  title: Text(ProfileOptUtil.settings.name),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(ProfileOptUtil.settings1.icon),
                      title: Text(ProfileOptUtil.settings1.name),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const Divider(),
              Card(
                child: ListTile(
                  leading: Icon(ProfileOptUtil.feedback.icon),
                  title: Text(ProfileOptUtil.feedback.name),
                  onTap: () {},
                ),
              ),
              const Divider(),
              Card(
                child: ListTile(
                  leading: Icon(ProfileOptUtil.help.icon),
                  title: Text(ProfileOptUtil.help.name),
                  onTap: () {},
                ),
              ),
              const Divider(),
              Card(
                child: ListTile(
                  leading: Icon(ProfileOptUtil.logout.icon),
                  title: Text(ProfileOptUtil.logout.name),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
