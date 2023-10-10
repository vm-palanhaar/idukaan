import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_4_screen.dart';
import 'package:idukaan/view/main/business/widgets/shop/add_shop_app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/ac_textformfield_widget.dart';
import 'package:idukaan/view/widgets/fields/dropdown_option_widget.dart';
import 'package:idukaan/view/widgets/fields/textformfield_widget.dart';
import 'package:provider/provider.dart';

class AddIrShop3Screen extends StatefulWidget {
  const AddIrShop3Screen({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/add/3';

  @override
  State<AddIrShop3Screen> createState() => _AddIrShop3ScreenState();
}

class _AddIrShop3ScreenState extends State<AddIrShop3Screen> {
  final _irAddIrShop3Key = GlobalKey<FormState>();
  late IrCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    super.initState();
  }

  String getPltType() {
    return ctrl.addIrShop.addIrShop3.getPltType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAddShop(
        context: context,
        title: ctrl.addIrShop.addIrShop1.getName,
        subtitle: 'location on railway station:',
        ind: 3 / 4,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Form(
            key: _irAddIrShop3Key,
            child: Column(
              children: <Widget>[
                AcTextFormFieldWidget(
                  list: ctrl.stationList!.stations,
                  icon: Icons.train_outlined,
                  labelText: 'Railway Station',
                  onSelect: (String selection) async {
                    ctrl.addIrShop.addIrShop3
                        .setStation(selection.split('-')[1].trim());
                  },
                ),
                DropdownOptionWidget(
                  icon: Icons.place_outlined,
                  labelText: 'Platform Type',
                  defaultValue: getPltType,
                  optionList: ctrl.addIrShop.addIrShop3.getPltTypes,
                  setValue: (String value) async {
                    setState(() {
                      ctrl.addIrShop.addIrShop3.setPltType(value);
                      ctrl.addIrShop.addIrShop3.setPlt1('');
                      ctrl.addIrShop.addIrShop3.setPlt2('');
                    });
                  },
                ),
                if (ctrl.addIrShop.addIrShop3.getPltType != 'No Platform')
                  TextFormFieldWidget(
                    prefixIcon: Icons.location_pin,
                    keyboardType: TextInputType.name,
                    labelText: 'Platform (A)',
                    onFieldSubmitted: ctrl.addIrShop.addIrShop3.setPlt1,
                  ),
                if (ctrl.addIrShop.addIrShop3.getPltType == 'Island Platform')
                  TextFormFieldWidget(
                    prefixIcon: Icons.location_pin,
                    keyboardType: TextInputType.name,
                    labelText: 'Platform (B)',
                    onFieldSubmitted: ctrl.addIrShop.addIrShop3.setPlt2,
                  ),
                ElevatedButtonWidget(
                  title: 'Next',
                  onPressed: () {
                    if (_irAddIrShop3Key.currentState!.validate()){
                      Navigator.pushNamed(context, AddIrShop4Screen.id);
                    }
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
