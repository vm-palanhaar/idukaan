import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/update_ir_shop_info_screen.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/ctext_error_widget.dart';
import 'package:idukaan/view/widgets/loading_widget.dart';
import 'package:idukaan/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class IrShopInfoIRSISWidget extends StatefulWidget {
  const IrShopInfoIRSISWidget({super.key});

  @override
  State<IrShopInfoIRSISWidget> createState() => _IrShopInfoIRSISWidgetState();
}

class _IrShopInfoIRSISWidgetState extends State<IrShopInfoIRSISWidget> {
  late IrCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    getIrShopInfo();

    super.initState();
  }

  Future<void> getIrShopInfo() async {
    await ctrl.getIrShopInfoApi(
      context: context,
    );
    setState(() {});
  }

  Widget shopImgWidget() {
    return Card(
      child: CachedNetworkImage(
        imageUrl: ctrl.irShopInfo!.shop!.shopImg,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget shopBasicInfoWidget() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.store_outlined),
            title: Text('${ctrl.irShopInfo!.shop!.shopName} '
                '(${ctrl.irShopInfo!.shop!.shopNo})'),
            subtitle: const Text('Stall Name (Stall No)'),
          ),
          ListTile(
            leading: const Icon(Icons.train_outlined),
            title: Text(ctrl.irShopInfo!.shop!.station),
            subtitle: const Text('Station'),
          ),
          if (ctrl.irShopInfo!.shop!.getPlt().isNotEmpty)
            ListTile(
              leading: const Icon(Icons.location_pin),
              title: Text('Platform: ${ctrl.irShopInfo!.shop!.getPlt()}'),
            ),
          ListTile(
            leading: const Icon(Icons.contact_phone_outlined),
            title: Text(ctrl.irShopInfo!.shop!.contactNo),
            subtitle: const Text('Contact Number'),
          ),
        ],
      ),
    );
  }

  Widget shopPaymentWidget() {
    return Card(
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
          ListTile(
            leading: const Icon(Icons.money_outlined),
            title: const Text('Cash'),
            trailing: payment(ctrl.irShopInfo!.shop!.isCash),
          ),
          ListTile(
            leading: const Icon(Icons.qr_code_outlined),
            title: const Text('UPI'),
            trailing: payment(ctrl.irShopInfo!.shop!.isUpi),
          ),
          ListTile(
            leading: const Icon(Icons.credit_card_outlined),
            title: const Text('Card'),
            trailing: payment(ctrl.irShopInfo!.shop!.isCard),
          ),
        ],
      ),
    );
  }

  Widget shopEditWidget() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.edit),
        title: const Text('Update Stall Info'),
        onTap: () {
          ctrl.updateIrShop.orgId = ctrl.irShop!.orgId;
          ctrl.updateIrShop.id = ctrl.irShop!.id;
          ctrl.updateIrShop.setContactNo(ctrl.irShopInfo!.shop!.contactNo);
          ctrl.updateIrShop.setIsCash(ctrl.irShopInfo!.shop!.isCash);
          ctrl.updateIrShop.setIsUpi(ctrl.irShopInfo!.shop!.isUpi);
          ctrl.updateIrShop.setIsCard(ctrl.irShopInfo!.shop!.isCard);
          Navigator.pushNamed(context, UpdateIrShopInfoScreen.id);
        },
      ),
    );
  }

  Icon payment(bool paymentMethod) {
    if (paymentMethod) {
      return const Icon(
        Icons.check,
        color: Colors.green,
      );
    }
    return const Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (ctrl.irShopInfo != null) {
      if (ctrl.irShopInfo!.shop != null) {
        return RefreshIndicator(
          onRefresh: () async => getIrShopInfo(),
          child: SingleChildScrollView(
            child: Container(
              margin: screenMargin(context),
              child: Column(
                children: <Widget>[
                  shopImgWidget(),
                  shopBasicInfoWidget(),
                  shopPaymentWidget(),
                  shopEditWidget(),
                ],
              ),
            ),
          ),
        );
      } else if (ctrl.irShopInfo!.error != null) {
        return CTextErrorWidget(text: ctrl.irShopInfo!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
