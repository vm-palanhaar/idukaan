import 'package:flutter/material.dart';
import 'package:idukaan/view/main/business/screens/org/add_org_screen.dart';
import 'package:idukaan/view/main/business/widgets/org/org_list_ols_widget.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';

class OrgListScreen extends StatelessWidget {
  const OrgListScreen({super.key});
  static String id = '/idukaan/business/org';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Business Enterprise',
      ),
      body: Container(
        margin: screenMargin(context),
        child: const OrgListOLSWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddOrgScreen.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
