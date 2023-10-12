import 'package:flutter/material.dart';
import 'package:idukaan/view/main/business/widgets/shop/ir_shop_list_irsls_widget.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';

class IrOrgShopListScreen extends StatelessWidget {
  const IrOrgShopListScreen({super.key});
  static String id = '/idukaan/business/org/id/shop/ir';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Manage Shop/Stall(s)',
      ),
      body: Container(
        margin: screenMargin(context),
        child: const IrShopListIRSLSWidget(),
      ),
    );
  }
}
