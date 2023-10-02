import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/ctext_error_widget.dart';
import 'package:idukaan/view/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class OrgInfoScreen extends StatefulWidget {
  const OrgInfoScreen({super.key});
  static String id = '/idukaan/business/org/id/info';

  @override
  State<OrgInfoScreen> createState() => _OrgInfoScreenState();
}

class _OrgInfoScreenState extends State<OrgInfoScreen> {
  late BusinessCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false);
    getOrgInfo();
    super.initState();
  }

  Future<void> getOrgInfo() async {
    await ctrl.getOrgInfoApi(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (ctrl.orgInfo != null) {
      if (ctrl.orgInfo!.org != null) {
        return Scaffold(
          appBar: appBar(
            context: context,
            title: ctrl.org!.name,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: screenMargin(context),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Type of Business Enterprise'),
                    subtitle: Text(ctrl.orgInfo!.org!.type),
                  ),
                  ListTile(
                    title: const Text('Total employees'),
                    subtitle: Text(ctrl.orgInfo!.org!.getNoEmp),
                  ),
                ],
              ),
            ),
          ),
        );
      } else if (ctrl.orgInfo!.error != null) {
        return CTextErrorWidget(text: ctrl.orgInfo!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
