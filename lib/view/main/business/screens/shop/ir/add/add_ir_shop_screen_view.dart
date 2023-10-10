import 'package:flutter/material.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_1_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_2_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_3_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_4_screen.dart';

class AddIrShopScreenView extends StatelessWidget {
  const AddIrShopScreenView({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/add';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: AddIrShop1Screen.id,
      routes: {
        AddIrShop1Screen.id: (_) => const AddIrShop1Screen(),
        AddIrShop2Screen.id: (_) => const AddIrShop2Screen(),
        AddIrShop3Screen.id: (_) => const AddIrShop3Screen(),
        AddIrShop4Screen.id: (_) => const AddIrShop4Screen(),
      },
    );
  }
}
