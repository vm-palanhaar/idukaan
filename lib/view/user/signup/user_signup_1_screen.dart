import 'package:flutter/material.dart';
import 'package:idukaan/controller/user/user_ctrl.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:provider/provider.dart';

class UserSignup1Screen extends StatelessWidget {
  const UserSignup1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserCtrl>(
      builder: (context, ctrl, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: ctrl.userSignupKey,
              child: Container(
                margin: screenMargin(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(ctrl.userSignUpReq.getFirstName),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
