import 'package:flutter/material.dart';
import 'package:idukaan/controller/local/local_ctrl.dart';
import 'package:idukaan/controller/router_config.dart';
import 'package:idukaan/controller/user/user_ctrl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalCtrl()),
        ChangeNotifierProvider(create: (_) => UserCtrl()),
      ],
      child: const IDukaan(),
    ),
  );
}

class IDukaan extends StatelessWidget {
  const IDukaan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'iDukaan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: routerConfig,
    );
  }
}
