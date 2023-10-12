import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/model/main/business/shop/ir/list/ir_shop_list_obj_res_mdl.dart';
import 'package:idukaan/view/main/business/widgets/shop/ir_shop_list_button_widget.dart';
import 'package:idukaan/view/widgets/ctext_error_widget.dart';
import 'package:idukaan/view/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class IrShopListIRSLSWidget extends StatefulWidget {
  const IrShopListIRSLSWidget({super.key});

  @override
  State<IrShopListIRSLSWidget> createState() => _IrShopListIRSLSWidgetState();
}

class _IrShopListIRSLSWidgetState extends State<IrShopListIRSLSWidget> {
  late IrCtrl irCtrl;
  late BusinessCtrl bCtrl;
  @override
  void initState() {
    bCtrl = Provider.of<BusinessCtrl>(context, listen: false);
    irCtrl = bCtrl.irCtrl;
    getOrgShopList(false);
    super.initState();
  }

  Future<void> getOrgShopList(bool reload) async {
    await irCtrl.getIrOrgShopsApi(
      context: context,
      orgId: Provider.of<BusinessCtrl>(context, listen: false).org!.id,
      reload: reload,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (irCtrl.irOrgShopList != null &&
        irCtrl.irOrgShopList!.orgId == bCtrl.org!.id) {
      if (irCtrl.irOrgShopList!.irShop.isNotEmpty) {
        return RefreshIndicator(
          onRefresh: () async => await getOrgShopList(true),
          child: CustomScrollView(
            slivers: [
              SliverList.separated(
                itemCount: irCtrl.irOrgShopList!.irShop.length,
                separatorBuilder: (context, index) {
                  if (index != irCtrl.irOrgShopList!.irShop.length - 1) {
                    return const Divider();
                  }
                  return null;
                },
                itemBuilder: (context, index) {
                  IrShopListObjResMdl irShop =
                      irCtrl.irOrgShopList!.irShop.elementAt(index);
                  return IrShopListButtonWidget(
                    key: ObjectKey(irShop.id),
                    irShop: irShop,
                    index: index,
                    onTap: () {
                      irCtrl.irShop = irShop;
                    },
                  );
                },
              ),
            ],
          ),
        );
      } else if (irCtrl.irOrgShopList!.error != null) {
        return CTextErrorWidget(text: irCtrl.irOrgShopList!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
