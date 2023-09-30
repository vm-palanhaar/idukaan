import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:provider/provider.dart';

class AddOrgScreen extends StatefulWidget {
  const AddOrgScreen({super.key});
  static String id = '/idukaan/business/org/add';

  @override
  State<AddOrgScreen> createState() => _AddOrgScreenState();
}

class _AddOrgScreenState extends State<AddOrgScreen> {
  late BusinessCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false);
    getOrgTypesApi();
    super.initState();
  }

  void getOrgTypesApi() async {
    await ctrl.getOrgTypesApi(
    context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Add Business Enterprise',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: const Column(
            children: <Widget>[],
          ),

        ),
      ),
    );
  }
}
