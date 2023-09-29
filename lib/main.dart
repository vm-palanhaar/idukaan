import 'package:flutter/material.dart';
import 'package:idukaan/controller/auth/auth_ctrl.dart';
import 'package:idukaan/view/init/init_view.dart';
import 'package:idukaan/view/init/splash_sceen.dart';
import 'package:idukaan/view/main/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const IDukaan());
}

class IDukaan extends StatelessWidget {
  const IDukaan({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthCtrl(),
      child: MaterialApp(
        title: 'iDukaan',
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (_) => const SplashScreen(),
          InitView.id: (_) => const InitView(),
          DashboardScreen.id: (_) => const DashboardScreen(),
        },
      ),
    );
  }
}


