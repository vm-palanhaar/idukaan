import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/view/main/business/util/shop/ir/ir_shop_opts.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/opt_widget.dart';
import 'package:provider/provider.dart';

class IrShopOptsScreen extends StatefulWidget {
  const IrShopOptsScreen({super.key});
  static String id = '/idukaan/business/org/id/ir/shop/id';

  @override
  State<IrShopOptsScreen> createState() => _IrShopOptsScreenState();
}

class _IrShopOptsScreenState extends State<IrShopOptsScreen> {
  late IrCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    super.initState();
  }

  void showXDialog({
    required String title,
    required String text,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(
          text,
        ),
      ),
    );
  }

  void showIrShopVerMsg({
    required String pageId,
  }) {
    if (!ctrl.irShop!.isVer) {
      showXDialog(
        title: 'Attention Required',
        text: ctrl.irShop!.msg,
      );
    } else {
      Navigator.pushNamed(context, pageId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: ctrl.irShop!.shopName,
      ),
      body: Container(
        margin: screenMargin(context),
        child: CustomScrollView(
          slivers: [
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                if (ctrl.irShop!.isActive)
                  OptWidget(
                    icon: IrShopOptUtil.anal.icon,
                    title: IrShopOptUtil.anal.name,
                    onTap: () {
                      showIrShopVerMsg(pageId: '');
                    },
                  ),
                if (ctrl.irShop!.isActive)
                  OptWidget(
                    icon: IrShopOptUtil.inv.icon,
                    title: IrShopOptUtil.inv.name,
                    onTap: () {
                      showIrShopVerMsg(pageId: '');
                    },
                  ),
                if (ctrl.irShop!.isActive)
                  OptWidget(
                    icon: IrShopOptUtil.hR.icon,
                    title: IrShopOptUtil.hR.name,
                    onTap: () {
                      showIrShopVerMsg(pageId: '');
                    },
                  ),
                OptWidget(
                  icon: IrShopOptUtil.legal.icon,
                  title: IrShopOptUtil.legal.name,
                  onTap: () {
                    showIrShopVerMsg(pageId: '');
                  },
                ),
                OptWidget(
                  icon: IrShopOptUtil.info.icon,
                  title: IrShopOptUtil.info.name,
                  onTap: () {
                    showIrShopVerMsg(pageId: '');
                  },
                ),
                OptWidget(
                  icon: IrShopOptUtil.sH.icon,
                  title: IrShopOptUtil.sH.name,
                  onTap: () {
                    showIrShopVerMsg(pageId: '');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
