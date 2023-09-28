import 'package:flutter/material.dart';
import 'package:idukaan/view/user/signup/user_signup_1_screen.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';

class UserSignupAcceptPlc extends StatelessWidget {
  const UserSignupAcceptPlc({super.key});
  static String id = '/idukaan/user/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Column(
            children: <Widget>[
              ElevatedButtonWidget(
                title: 'Accept and Continue',
                onPressed: () {
                  Navigator.pushNamed(context, UserSignup1Screen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
