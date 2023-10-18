import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/view/main/business/screens/org/org_opts_screen.dart';
import 'package:idukaan/view/main/business/util/shop/ir/add_ir_shop_util.dart';
import 'package:idukaan/view/main/business/widgets/shop/add_shop_app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/calendar_widget.dart';
import 'package:idukaan/view/widgets/fields/pick_file_widget.dart';
import 'package:idukaan/view/widgets/fields/textformfield_widget.dart';
import 'package:idukaan/view/widgets/list_tile_error_widget.dart';
import 'package:idukaan/view/widgets/text_error_widget.dart';
import 'package:idukaan/view/widgets/text_widget.dart';
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

  void showFetchShopLoc() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Your current location is being tracked for shop location!',
        ),
      ),
    );
  }

  bool _validateFormAddIrShop4() {
    int total = 4;
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
    if (ctrl.addIrShop.addIrShop3.getLat.isNotEmpty &&
        ctrl.addIrShop.addIrShop3.getLon.isNotEmpty) {
      count++;
    } else if (ctrl.addIrShop.addIrShop3.getLat.isEmpty &&
        ctrl.addIrShop.addIrShop3.getLon.isEmpty) {
      showFetchShopLoc();
    }

    setState(() {});
    if (count == total) {
      return true;
    }
    return false;
  }

  void _successRes() {
    Navigator.popUntil(context, ModalRoute.withName(OrgOptsScreen.id));
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ListTile(
                title: Center(
                  child: TextWidget(
                    text: ctrl.addIrShop.addIrShop1.getName,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  children: [
                    Text('Stall No: ${ctrl.addIrShop.addIrShop1.getShopNo}'),
                    Text(
                      'Railway Station: ${ctrl.addIrShop.addIrShop3.getStation}',
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(ctrl.addIrShopRes!.message),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAddShop(
        context: context,
        title: ctrl.addIrShop.addIrShop1.getName,
        subtitle: AddIrShopNotes.s4AppBarNote.toLowerCase(),
        ind: 5 / 5,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Form(
            key: _irAddIrShop4Key,
            child: Column(
              children: <Widget>[
                if (ctrl.addIrShopRes != null &&
                    ctrl.addIrShopRes!.error != null)
                  Card(
                    child: ListTileErrorWidget(
                      title: 'Attention Required',
                      subtitle: ctrl.addIrShopRes!.error!.msg,
                    ),
                  ),
                TextFormFieldWidget(
                  prefixIcon: AddIrShopFields.s4LicNo.icon,
                  labelText: AddIrShopFields.s4LicNo.title,
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: ctrl.addIrShop.addIrShop4.setLicNo,
                ),
                if (_errorIsDoc) const TextErrorWidget(text: 'Document !'),
                PickFileWidget(
                  icon: AddIrShopFields.s4LicDoc.icon,
                  labelText: AddIrShopFields.s4LicDoc.title,
                  onPressed: ctrl.addIrShop.addIrShop4.setLicDoc,
                ),
                if (_errorIsLicSd) const TextErrorWidget(text: 'Start Date !'),
                CalendarWidget(
                  title: AddIrShopFields.s4LicSd.title,
                  onTap: ctrl.addIrShop.addIrShop4.setLicSd,
                  lastDate: DateTime.now(),
                ),
                if (_errorIsLicEd) const TextErrorWidget(text: 'End Date !'),
                CalendarWidget(
                  title: AddIrShopFields.s4LicEd.title,
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
                      if (_validateFormAddIrShop4()) {
                        await ctrl.postIrShopApi(context: context);
                        if (ctrl.addIrShopRes != null) {
                          if (ctrl.addIrShopRes!.irShop != null) {
                            _successRes();
                          } else if (ctrl.addIrShopRes!.error != null) {
                            setState(() {});
                            //TODO: Manage multiple error codes
                          }
                        }
                      }
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
