import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/view/main/business/screens/org/emp/add_org_emp_screen.dart';
import 'package:idukaan/view/main/business/widgets/org/org_emp_list_oels_widget.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:provider/provider.dart';

class OrgEmpListScreen extends StatelessWidget {
  const OrgEmpListScreen({super.key});
  static String id = '/idukaan/business/org/id/emp';

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<BusinessCtrl>(context, listen: false);
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Employees',
        actions: [
          if (ctrl.org!.empMng)
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddOrgEmpScreen.id);
              },
              icon: const Icon(Icons.person_add),
            ),
        ],
      ),
      body: const OrgEmpListOELSWidget(),
    );
  }
}
