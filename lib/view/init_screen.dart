import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idukaan/controller/user/user_ctrl.dart';
import 'package:idukaan/model/init/init_data.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/text_widget.dart';
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
                  onTap: () => context.go('/idukaan/user/login'),
                ),
                const Divider(),
                ListTile(
                  title: Text(InitData.signUp.name),
                  trailing: Icon(InitData.signUp.icon),
                  onTap: () {
                    context.push('/idukaan/user/signup/1');
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
      ),
    );
  }
}
