import 'package:flutter/material.dart';
import 'package:idukaan/model/init/init_data.dart';
import 'package:idukaan/view/user/login/user_login_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_accept_plc.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/text_widget.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});
  static String id = '/idukaan/init';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: screenMargin(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: const Image(
                      image: AssetImage('assets/images/idukaan.png'),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextWidget(
                text: 'Welcome to\niDukaan by Palanhaar',
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
              const Spacer(),
              const Divider(),
              ListTile(
                title: Text(InitData.login.name),
                trailing: Icon(InitData.login.icon),
                onTap: () {
                  Navigator.pushNamed(context, UserLoginScreen.id);
                },
              ),
              const Divider(),
              ListTile(
                title: Text(InitData.signUp.name),
                trailing: Icon(InitData.signUp.icon),
                onTap: () {
                  Navigator.pushNamed(context, UserSignupAcceptPlc.id);
                },
              ),
              const Divider(),
              ListTile(
                title: Text(InitData.intro.name),
                trailing: Icon(InitData.intro.icon),
              ),
              const Divider(),
              const Spacer(),
              TextWidget(
                text: '',
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
