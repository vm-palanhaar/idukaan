import 'package:flutter/material.dart';
import 'package:idukaan/view/user/signup/user_signup_1_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_2_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_3_screen.dart';

class UserSignupView extends StatefulWidget {
  const UserSignupView({super.key});

  @override
  State<UserSignupView> createState() => _UserSignupViewState();
}

class _UserSignupViewState extends State<UserSignupView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(
            () {
              if (!tabController.indexIsChanging) {
                setState(
                  () {
                    index = tabController.index;
                  },
                );
              }
            },
          );
          return TabBarView(
            controller: tabController,
            children: const <Widget>[
              UserSignup1Screen(),
              UserSignup2Screen(),
              UserSignup3Screen(),
            ],
          );
        },
      ),
    );
  }
}
