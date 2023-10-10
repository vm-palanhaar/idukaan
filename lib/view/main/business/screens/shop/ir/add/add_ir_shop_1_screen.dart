import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_2_screen.dart';
import 'package:idukaan/view/main/business/widgets/shop/add_shop_app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/pick_image_gallery_widget.dart';
import 'package:idukaan/view/widgets/fields/textformfield_widget.dart';
import 'package:idukaan/view/widgets/text_error_widget.dart';
import 'package:provider/provider.dart';

class AddIrShop1Screen extends StatefulWidget {
  const AddIrShop1Screen({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/add/1';

  @override
  State<AddIrShop1Screen> createState() => _AddIrShop1ScreenState();
}

class _AddIrShop1ScreenState extends State<AddIrShop1Screen> {
  final _irAddIrShop1Key = GlobalKey<FormState>();
  late IrCtrl ctrl;
  bool _errorIsStallImg = false;
  bool _errorIsLoc = true;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    ctrl.addIrShop.setInitValues();
    ctrl.addIrShop.setOrg(
      Provider.of<BusinessCtrl>(context, listen: false).org!.id,
    );
    ctrl.getStationListApi(context: context);
    super.initState();
    validateLocPerm();
    /*WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Your current location is being tracked for shop location!',
            ),
          ),
        );
      },
    );*/
  }

  void validateLocPerm() async {
    _errorIsLoc = await ctrl.getIrShopLoc();
    if (_errorIsLoc) {
      showLocPermDeniedDialog();
    } else {}
  }

  void showLocPermDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        icon: Icon(
          Icons.location_on,
          color: Colors.red,
        ),
        title: Text('Permission Denied'),
        content: Text(
          'To provide you with a secure and enhanced experience, our app '
          'requires access to your location. This is essential  for '
          'tagging your location, verifying shops, and displaying '
          'relevant information to passengers.\n'
          'To enable this feature, please go to your device settings and '
          'grant permission to access your location. Your privacy and '
          'security are of utmost importance to us, and we will only use '
          ' this data for the purposes mentioned.',
        ),
      ),
    );
  }

  bool _validateFormAddIrShop1() {
    if (ctrl.addIrShop.addIrShop1.getImg.isEmpty) {
      setState(() {
        _errorIsStallImg = true;
      });
      return false;
    }
    setState(() {
      _errorIsStallImg = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAddShop(
        context: context,
        title: 'Add Stall',
        subtitle: 'on railway station premises',
        ind: 1 / 4,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Form(
            key: _irAddIrShop1Key,
            child: Column(
              children: <Widget>[
                TextFormFieldWidget(
                  prefixIcon: Icons.store_outlined,
                  keyboardType: TextInputType.name,
                  labelText: 'Stall Name',
                  onFieldSubmitted: ctrl.addIrShop.addIrShop1.setName,
                ),
                TextFormFieldWidget(
                  prefixIcon: Icons.numbers_outlined,
                  keyboardType: TextInputType.name,
                  labelText: 'Stall No',
                  onFieldSubmitted: ctrl.addIrShop.addIrShop1.setShopNo,
                ),
                if (_errorIsStallImg)
                  const TextErrorWidget(text: 'Stall Image !'),
                PickImageGalleryWidget(
                  labelText: 'Stall Image',
                  onPressed: ctrl.addIrShop.addIrShop1.setImg,
                ),
                TextFormFieldWidget(
                  prefixIcon: Icons.contact_phone_outlined,
                  keyboardType: TextInputType.number,
                  labelText: 'Contact Number',
                  onFieldSubmitted: ctrl.addIrShop.addIrShop1.setContactNo,
                ),
                ElevatedButtonWidget(
                  title: 'Next',
                  onPressed: () {
                    if (!_errorIsLoc) {
                      _validateFormAddIrShop1();
                      if (_irAddIrShop1Key.currentState!.validate()) {
                        if (_validateFormAddIrShop1()) {
                          Navigator.pushNamed(context, AddIrShop2Screen.id);
                        }
                      }
                    } else {
                      showLocPermDeniedDialog();
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
