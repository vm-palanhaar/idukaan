import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/profile/profile_ctrl.dart';
import 'package:idukaan/model/main/profile/info/profile_info_res_mdl.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({super.key});

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  late ProfileCtrl ctrl;
  ProfileInfoResMdl? res;

  @override
  void initState() {
    ctrl = Provider.of<ProfileCtrl>(context, listen: false);
    super.initState();
    getProfileInfo();
  }

  Future<void> getProfileInfo() async {
    res = await ctrl.getProfileInfoApi(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (res != null) {
      return Container(
        margin: screenMargin(context),
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Name'),
              subtitle: Text('${res!.fName} ${res!.lName}'),
            ),
            ListTile(
              title: const Text('Username'),
              subtitle: Text(res!.userName),
            ),
            ListTile(
              title: const Text('Email'),
              subtitle: Text(res!.email),
            ),
            ListTile(
              title: const Text('Contact Number'),
              subtitle: Text(res!.contactNo),
            ),
          ],
        ),
      );
    }
    return const LoadingWidget();
  }
}
