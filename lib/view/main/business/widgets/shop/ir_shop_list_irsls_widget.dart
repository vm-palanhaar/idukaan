import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:provider/provider.dart';

class IrShopListIRSLSWidget extends StatefulWidget {
  const IrShopListIRSLSWidget({super.key});

  @override
  State<IrShopListIRSLSWidget> createState() => _IrShopListIRSLSWidgetState();
}

class _IrShopListIRSLSWidgetState extends State<IrShopListIRSLSWidget> {
  late IrCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    getOrgShopList(false);
    super.initState();
  }

  Future<void> getOrgShopList(bool reload) async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await getOrgShopList(true),
      child: const CustomScrollView(),

    );
  }
}
