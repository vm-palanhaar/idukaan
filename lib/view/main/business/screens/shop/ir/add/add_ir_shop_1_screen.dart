import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_2_screen.dart';
import 'package:idukaan/view/main/business/util/shop/ir/add_ir_shop_util.dart';
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

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Your current location is being tracked for stall location!',
            ),
          ),
        );
      },
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
        title: 'Stall Registration',
        subtitle: AddIrShopNotes.s1AppBarNote.toLowerCase(),
        ind: 2 / 5,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Form(
            key: _irAddIrShop1Key,
            child: Column(
              children: <Widget>[
                TextFormFieldWidget(
                  prefixIcon: AddIrShopFields.s1StallName.icon,
                  labelText: AddIrShopFields.s1StallName.title,
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: ctrl.addIrShop.addIrShop1.setName,
                ),
                TextFormFieldWidget(
                  prefixIcon: AddIrShopFields.s1StallNo.icon,
                  labelText: AddIrShopFields.s1StallNo.title,
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: ctrl.addIrShop.addIrShop1.setShopNo,
                ),
                TextFormFieldWidget(
                  prefixIcon: AddIrShopFields.s1StallContactNo.icon,
                  labelText: AddIrShopFields.s1StallContactNo.title,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: ctrl.addIrShop.addIrShop1.setContactNo,
                ),
                if (_errorIsStallImg)
                  TextErrorWidget(
                      text: '${AddIrShopFields.s1StallImg.title} !'),
                PickImageGalleryWidget(
                  labelText: AddIrShopFields.s1StallImg.title,
                  onPressed: ctrl.addIrShop.addIrShop1.setImg,
                ),
                ElevatedButtonWidget(
                  title: 'Next',
                  onPressed: () {
                    _validateFormAddIrShop1();
                    if (_irAddIrShop1Key.currentState!.validate()) {
                      if (_validateFormAddIrShop1()) {
                        Navigator.pushNamed(context, AddIrShop2Screen.id);
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
