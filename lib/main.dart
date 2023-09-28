import 'package:flutter/material.dart';
import 'package:idukaan/controller/local/local_ctrl.dart';
import 'package:idukaan/view/init/init_view.dart';
import 'package:idukaan/view/init/init_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocalCtrl(),
      child: const IDukaan(),
    ),
  );
}

class IDukaan extends StatefulWidget {
  const IDukaan({super.key});

  @override
  State<IDukaan> createState() => _IDukaanState();
}

class _IDukaanState extends State<IDukaan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iDukaan',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: InitView.id,
      routes: {
        InitView.id: (_) => const InitView(),
      },
    );
  }
}
