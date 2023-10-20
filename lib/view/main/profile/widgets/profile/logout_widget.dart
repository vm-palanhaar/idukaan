import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/profile/profile_ctrl.dart';
import 'package:idukaan/view/main/profile/util/profile_util.dart';
import 'package:idukaan/view/widgets/list_tile_row_widget.dart';
import 'package:provider/provider.dart';

class LogoutWidget extends StatefulWidget {
  const LogoutWidget({super.key});

  @override
  State<LogoutWidget> createState() => _LogoutWidgetState();
}

class _LogoutWidgetState extends State<LogoutWidget> {
  late ProfileCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<ProfileCtrl>(context, listen: false);
    super.initState();
  }

  Future<void> userLogout() async {
    await ctrl.postLogoutApi(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ListTileRowWidget(
      title: ProfileOptUtil.logout.name,
      icon: ProfileOptUtil.logout.icon,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Logout'),
              content: const Text(
                'Are you sure you want to logout of your current session?',
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await userLogout();
                  },
                  child: const Text('Logout'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Dismiss'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
