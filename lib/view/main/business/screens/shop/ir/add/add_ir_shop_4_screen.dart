import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/view/main/business/widgets/shop/add_shop_app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/calendar_widget.dart';
import 'package:idukaan/view/widgets/fields/pick_file_widget.dart';
import 'package:idukaan/view/widgets/fields/textformfield_widget.dart';
import 'package:idukaan/view/widgets/text_error_widget.dart';
import 'package:provider/provider.dart';

class AddIrShop4Screen extends StatefulWidget {
  const AddIrShop4Screen({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/add/4';

  @override
  State<AddIrShop4Screen> createState() => _AddIrShop4ScreenState();
}

class _AddIrShop4ScreenState extends State<AddIrShop4Screen> {
  final _irAddIrShop4Key = GlobalKey<FormState>();
  late IrCtrl ctrl;
  bool _errorIsDoc = false;
  bool _errorIsLicSd = false;
  bool _errorIsLicEd = false;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    super.initState();
  }

  bool _validateFormAddIrShop4() {
    int total = 3;
    int count = 0;
    if (ctrl.addIrShop.addIrShop4.getLicDoc.isEmpty) {
      _errorIsDoc = true;
    } else if (ctrl.addIrShop.addIrShop4.getLicDoc.isNotEmpty) {
      _errorIsDoc = false;
      count++;
    }
    if (ctrl.addIrShop.addIrShop4.getLicSd.isEmpty) {
      _errorIsLicSd = true;
    } else if (ctrl.addIrShop.addIrShop4.getLicSd.isNotEmpty) {
      _errorIsLicSd = false;
      count++;
    }
    if (ctrl.addIrShop.addIrShop4.getLicEd.isEmpty) {
      _errorIsLicEd = true;
    } else if (ctrl.addIrShop.addIrShop4.getLicEd.isNotEmpty) {
      _errorIsLicEd = false;
      count++;
    }
    if (count == total) {
      return true;
    }
    setState(() {});
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAddShop(
        context: context,
        title: ctrl.addIrShop.addIrShop1.getName,
        subtitle: 'stall license:',
        ind: 4 / 4,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Form(
            key: _irAddIrShop4Key,
            child: Column(
              children: <Widget>[
                TextFormFieldWidget(
                  prefixIcon: Icons.confirmation_number_outlined,
                  keyboardType: TextInputType.name,
                  labelText: 'License Number',
                  onFieldSubmitted: ctrl.addIrShop.addIrShop4.setLicNo,
                ),
                if (_errorIsDoc) const TextErrorWidget(text: 'Document !'),
                PickFileWidget(
                  icon: Icons.file_present_outlined,
                  labelText: 'Document (.pdf)',
                  onPressed: ctrl.addIrShop.addIrShop4.setLicDoc,
                ),
                if (_errorIsLicSd) const TextErrorWidget(text: 'Start Date !'),
                CalendarWidget(
                  title: 'Start Date',
                  onTap: ctrl.addIrShop.addIrShop4.setLicSd,
                  lastDate: DateTime.now(),
                ),
                if (_errorIsLicEd) const TextErrorWidget(text: 'End Date !'),
                CalendarWidget(
                  title: 'End Date',
                  onTap: ctrl.addIrShop.addIrShop4.setLicEd,
                  lastDate: DateTime.now().add(
                    const Duration(days: 1830),
                  ),
                ),
                ElevatedButtonWidget(
                  title: 'Submit',
                  onPressed: () async {
                    _validateFormAddIrShop4();
                    if (_irAddIrShop4Key.currentState!.validate()) {
                      if (_validateFormAddIrShop4()) {}
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
