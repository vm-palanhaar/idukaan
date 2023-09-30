import 'package:flutter/material.dart';
import 'package:idukaan/controller/user/user_ctrl.dart';
import 'package:idukaan/view/init/init_screen.dart';
import 'package:idukaan/view/main/home_screen_view.dart';
import 'package:idukaan/view/user/login/user_login_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_1_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_2_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_3_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_accept_plc.dart';
import 'package:provider/provider.dart';

class InitView extends StatelessWidget {
  const InitView({super.key});
  static String id = '/idukaan/user';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserCtrl(),
      child: MaterialApp(
        title: 'Initiating iDukaan',
        initialRoute: InitScreen.id,
        routes: {
          InitScreen.id: (_) => const InitScreen(),
          // user login
          UserLoginScreen.id: (_) => const UserLoginScreen(),
          /* user signup view -> fill form in 4 different screen
          1. Accept T&C and Privacy Policy
          2. Personal Info
          3. Contact Info
          4. User credentials
           */
          //TODO: Design a screen for T&C and Privacy Policy
          UserSignupAcceptPlc.id: (_) => const UserSignupAcceptPlc(),
          UserSignup1Screen.id: (_) => const UserSignup1Screen(),
          UserSignup2Screen.id: (_) => const UserSignup2Screen(),
          UserSignup3Screen.id: (_) => const UserSignup3Screen(),
          // navigate to main screen
          HomeScreenView.id: (_) => const HomeScreenView(),
        },
      ),
    );
  }
}
