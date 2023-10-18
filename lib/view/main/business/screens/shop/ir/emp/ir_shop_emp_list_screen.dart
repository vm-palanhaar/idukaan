import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/emp/add_ir_shop_emp_screen.dart';
import 'package:idukaan/view/main/business/widgets/shop/ir/ir_shop_emp_list_irels_widget.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:provider/provider.dart';

class IrShopEmpListScreen extends StatelessWidget {
  const IrShopEmpListScreen({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/id/emp';

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Employees',
        actions: [
          if (ctrl.irShop!.empMng)
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddIrShopEmpScreen.id);
              },
              icon: const Icon(Icons.person_add),
            ),
        ],
      ),
      body: const IrShopEmpListIRELSWidget(),
    );
  }
}
