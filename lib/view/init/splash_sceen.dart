import 'package:flutter/material.dart';
import 'package:idukaan/controller/auth/auth_ctrl.dart';
import 'package:idukaan/view/init/init_view.dart';
import 'package:idukaan/view/main/home_screen_view.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = '/idukaan/init';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getUserLoggedIn();
    super.initState();
  }

  void getUserLoggedIn() async {
    AuthCtrl ctrl = Provider.of<AuthCtrl>(context, listen: false);
    ctrl.readAllKeys();
    await ctrl.getUserLoggedInLocal();
    if (ctrl.userLoggedIn) {
      navigateToMainScreen();
    } else {
      navigateToUserScreen();
    }
  }

  void navigateToMainScreen() {
    Navigator.pushReplacementNamed(context, HomeScreenView.id);
  }

  void navigateToUserScreen() {
    Navigator.pushReplacementNamed(context, InitView.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/idukaan.png',
          height: MediaQuery.of(context).size.height * 0.21,
        ),
      ),
    );
  }
}
