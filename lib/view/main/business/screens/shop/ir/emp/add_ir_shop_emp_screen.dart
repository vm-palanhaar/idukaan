import 'package:flutter/material.dart';
import 'package:idukaan/view/main/business/widgets/shop/ir/add_ir_org_shop_emp_list_widget.dart';
import 'package:idukaan/view/util/app_bar.dart';

class AddIrShopEmpScreen extends StatefulWidget {
  const AddIrShopEmpScreen({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/id/emp/add';

  @override
  State<AddIrShopEmpScreen> createState() => _AddIrShopEmpScreenState();
}

class _AddIrShopEmpScreenState extends State<AddIrShopEmpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Employee Onboarding',
      ),
      body: const AddIrOrgShopEmpListWidget(),
    );
  }
}
