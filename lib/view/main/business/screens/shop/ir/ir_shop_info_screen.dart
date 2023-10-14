import 'package:flutter/material.dart';
import 'package:idukaan/view/main/business/widgets/shop/ir/ir_shop_info_irsis_widget.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';

class IrShopInfoScreen extends StatelessWidget {
  const IrShopInfoScreen({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/id/info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Stall Info',
      ),
      body: Container(
        margin: screenMargin(context),
        child: const IrShopInfoIRSISWidget(),
      ),
    );
  }
}
