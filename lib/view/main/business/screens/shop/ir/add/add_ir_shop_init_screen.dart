import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_1_screen.dart';
import 'package:idukaan/view/main/business/util/shop/ir/add_ir_shop_util.dart';
import 'package:idukaan/view/main/business/widgets/shop/add_shop_app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class AddIrShopInitScreen extends StatefulWidget {
  const AddIrShopInitScreen({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/add';

  @override
  State<AddIrShopInitScreen> createState() => _AddIrShopInitScreenState();
}

class _AddIrShopInitScreenState extends State<AddIrShopInitScreen> {
  late IrCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    ctrl.addIrShop.setInitValues();
    ctrl.addIrShop.setOrg(
      Provider.of<BusinessCtrl>(context, listen: false).org!.id,
    );
    ctrl.getStationListApi(context: context);
    super.initState();
  }

  void moveToNextScreen() {
    Navigator.pushNamed(context, AddIrShop1Screen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAddShop(
        context: context,
        title: 'Stall Registration',
        subtitle: 'summary of the information required',
        ind: 1 / 5,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Column(
            children: <Widget>[
              const TextWidget(
                text: 'The information required for successfully registering a '
                    'stall encompassing the details for each screen:',
              ),
              Divider(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              ListTile(
                title: const Text('Location Permission'),
                subtitle: AddIrShopNotes.irShopLocNote(),
              ),
              Divider(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              ExpansionTile(
                leading: const Text('Screen 1'),
                title: const Text(AddIrShopNotes.s1AppBarNote),
                children: [
                  ListTile(
                    leading: Icon(AddIrShopFields.s1StallName.icon),
                    title: Text(AddIrShopFields.s1StallName.title),
                  ),
                  ListTile(
                    leading: Icon(AddIrShopFields.s1StallNo.icon),
                    title: Text(AddIrShopFields.s1StallNo.title),
                  ),
                  ListTile(
                    leading: Icon(AddIrShopFields.s1StallContactNo.icon),
                    title: Text(AddIrShopFields.s1StallContactNo.title),
                  ),
                  ListTile(
                    leading: Icon(AddIrShopFields.s1StallImg.icon),
                    title: Text(AddIrShopFields.s1StallImg.title),
                    subtitle: AddIrShopNotes.irShopImgNote(),
                  ),
                ],
              ),
              Divider(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              ExpansionTile(
                leading: const Text('Screen 2'),
                title: const Text(AddIrShopNotes.s2AppBarNote),
                children: [
                  ListTile(
                    leading: Icon(AddIrShopFields.s2Cash.icon),
                    title: Text(AddIrShopFields.s2Cash.title),
                  ),
                  ListTile(
                    leading: Icon(AddIrShopFields.s2Upi.icon),
                    title: Text(AddIrShopFields.s2Upi.title),
                  ),
                  ListTile(
                    leading: Icon(AddIrShopFields.s2Card.icon),
                    title: Text(AddIrShopFields.s2Card.title),
                  ),
                ],
              ),
              Divider(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              ExpansionTile(
                leading: const Text('Screen 3'),
                title: const Text(AddIrShopNotes.s3AppBarNote),
                children: [
                  ListTile(
                    leading: Icon(AddIrShopFields.s3Station.icon),
                    title: Text(AddIrShopFields.s3Station.title),
                  ),
                  ListTile(
                    leading: Icon(AddIrShopFields.s3Toa.icon),
                    title: Text(AddIrShopFields.s3Toa.title),
                  ),
                  ListTile(
                    leading: Icon(AddIrShopFields.s3Plt.icon),
                    title: Text(AddIrShopFields.s3Plt.title),
                  ),
                ],
              ),
              Divider(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              ExpansionTile(
                leading: const Text('Screen 4'),
                title: const Text(AddIrShopNotes.s4AppBarNote),
                children: [
                  ListTile(
                    leading: Icon(AddIrShopFields.s4LicNo.icon),
                    title: Text(AddIrShopFields.s4LicNo.title),
                  ),
                  ListTile(
                    leading: Icon(AddIrShopFields.s4LicDoc.icon),
                    title: Text(AddIrShopFields.s4LicDoc.title),
                  ),
                  ListTile(
                    leading: Icon(AddIrShopFields.s4LicSd.icon),
                    title: Text(AddIrShopFields.s4LicSd.title),
                  ),
                  ListTile(
                    leading: Icon(AddIrShopFields.s4LicEd.icon),
                    title: Text(AddIrShopFields.s4LicEd.title),
                  ),
                ],
              ),
              Divider(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              ElevatedButtonWidget(
                title: 'Next',
                onPressed: () async {
                  if (await ctrl.getIrShopLoc()) {
                    moveToNextScreen();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
