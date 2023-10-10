import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_3_screen.dart';
import 'package:idukaan/view/main/business/widgets/shop/add_shop_app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/switch_widget.dart';
import 'package:provider/provider.dart';

class AddIrShop2Screen extends StatefulWidget {
  const AddIrShop2Screen({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/add/2';

  @override
  State<AddIrShop2Screen> createState() => _AddIrShop2ScreenState();
}

class _AddIrShop2ScreenState extends State<AddIrShop2Screen> {
  final _irAddIrShop2Key = GlobalKey<FormState>();
  late IrCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAddShop(
        context: context,
        title: ctrl.addIrShop.addIrShop1.getName,
        subtitle: 'accepts the following payment methods:',
        ind: 2 / 4,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Form(
            key: _irAddIrShop2Key,
            child: Column(
              children: <Widget>[
                SwitchWidget(
                  icon: Icons.money_outlined,
                  text: 'Cash',
                  defaultValue: ctrl.addIrShop.addIrShop2.getIsCash,
                  onChanged: (bool value) {
                    setState(() {
                      ctrl.addIrShop.addIrShop2.setIsCash(value);
                    });
                  },
                ),
                SwitchWidget(
                  icon: Icons.qr_code_outlined,
                  text: 'UPI',
                  defaultValue: ctrl.addIrShop.addIrShop2.getIsUpi,
                  onChanged: (bool value) {
                    setState(() {
                      ctrl.addIrShop.addIrShop2.setIsUpi(value);
                    });
                  },
                ),
                SwitchWidget(
                  icon: Icons.credit_card_outlined,
                  text: 'Card',
                  defaultValue: ctrl.addIrShop.addIrShop2.getIsCard,
                  onChanged: (bool value) {
                    setState(() {
                      ctrl.addIrShop.addIrShop2.setIsCard(value);
                    });
                  },
                ),
                ElevatedButtonWidget(
                  title: 'Next',
                  onPressed: () {
                    Navigator.pushNamed(context, AddIrShop3Screen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
