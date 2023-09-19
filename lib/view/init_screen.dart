import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idukaan/controller/user/user_ctrl.dart';
import 'package:idukaan/model/init/init_data.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/util/texts.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    isUserLoggedIn();
    super.initState();
  }

  Future<void> isUserLoggedIn() async {}

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserCtrl(),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
            ),
            child: const Image(
              image: AssetImage('assets/images/idukaan.png'),
            ),
          ),
        ),
        body: Container(
          margin: screenMargin(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              boldSizeText(
                text: 'Welcome to\niDukaan by Palanhaar',
                size: MediaQuery.of(context).size.height * 0.03,
              ),
              const Spacer(),
              const Divider(),
              ListTile(
                title: Text(InitData.login.name),
                trailing: Icon(InitData.login.icon),
                onTap: () => context.go('/idukaan/user/login'),
              ),
              const Divider(),
              ListTile(
                title: Text(InitData.signUp.name),
                trailing: Icon(InitData.signUp.icon),
                onTap: () => context.go('/idukaan/user/signup'),
              ),
              const Divider(),
              ListTile(
                title: Text(InitData.intro.name),
                trailing: Icon(InitData.intro.icon),
              ),
              const Divider(),
              const Spacer(),
              boldSizeText(
                text: '',
                size: MediaQuery.of(context).size.height * 0.03,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
