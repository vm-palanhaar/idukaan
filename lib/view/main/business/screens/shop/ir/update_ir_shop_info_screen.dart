import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/view/main/business/util/shop/ir/add_ir_shop_util.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/fields/switch_widget.dart';
import 'package:idukaan/view/widgets/fields/textformfield_widget.dart';
import 'package:idukaan/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UpdateIrShopInfoScreen extends StatefulWidget {
  const UpdateIrShopInfoScreen({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/id/update';

  @override
  State<UpdateIrShopInfoScreen> createState() => _UpdateIrShopInfoScreenState();
}

class _UpdateIrShopInfoScreenState extends State<UpdateIrShopInfoScreen> {
  final _irUpdateIrShopKey = GlobalKey<FormState>();
  late IrCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    super.initState();
  }

  void showXDialog({
    required String title,
    required String content,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error_outline, color: Colors.red),
        title: Text(title),
        content: Text(content),
      ),
    );
  }

  void validateRes() {
    if (ctrl.updateIrShopRes != null) {
      if (ctrl.updateIrShopRes!.shop != null) {
        ctrl.irShopInfo!.shop!.contactNo =
            ctrl.updateIrShopRes!.shop!.contactNo;
        ctrl.irShopInfo!.shop!.isCash = ctrl.updateIrShopRes!.shop!.isCash;
        ctrl.irShopInfo!.shop!.isUpi = ctrl.updateIrShopRes!.shop!.isUpi;
        ctrl.irShopInfo!.shop!.isCard = ctrl.updateIrShopRes!.shop!.isCard;
        Navigator.pop(context);
      } else if (ctrl.updateIrShopRes!.error != null) {
        showXDialog(
          title: 'Action Failed',
          content: ctrl.updateIrShopRes!.error!.msg,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Update Stall Info',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Form(
            key: _irUpdateIrShopKey,
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    children: [
                      const ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.info_outlined),
                        ),
                        title: TextWidget(
                          text: 'Contact Info',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormFieldWidget(
                        prefixIcon: AddIrShopFields.s1StallContactNo.icon,
                        labelText: AddIrShopFields.s1StallContactNo.title,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: ctrl.updateIrShop.setContactNo,
                        initialValue: ctrl.updateIrShop.getContactNo,
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      const ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.currency_rupee_outlined),
                        ),
                        title: TextWidget(
                          text: 'Payment Modes',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SwitchWidget(
                        icon: AddIrShopFields.s2Cash.icon,
                        text: AddIrShopFields.s2Cash.title,
                        defaultValue: ctrl.updateIrShop.getIsCash,
                        onChanged: (bool value) {
                          setState(() {
                            ctrl.updateIrShop.setIsCash(value);
                          });
                        },
                      ),
                      SwitchWidget(
                        icon: AddIrShopFields.s2Upi.icon,
                        text: AddIrShopFields.s2Upi.title,
                        defaultValue: ctrl.updateIrShop.getIsUpi,
                        onChanged: (bool value) {
                          setState(() {
                            ctrl.updateIrShop.setIsUpi(value);
                          });
                        },
                      ),
                      SwitchWidget(
                        icon: AddIrShopFields.s2Card.icon,
                        text: AddIrShopFields.s2Card.title,
                        defaultValue: ctrl.updateIrShop.getIsCard,
                        onChanged: (bool value) {
                          setState(() {
                            ctrl.updateIrShop.setIsCard(value);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_irUpdateIrShopKey.currentState!.validate()) {
            await ctrl.patchIrShopInfoApi(context: context);
            validateRes();
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
