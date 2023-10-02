import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/model/main/business/util/org_opts.dart';
import 'package:idukaan/view/main/business/screens/org/org_info_screen.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/opt_widget.dart';
import 'package:provider/provider.dart';

class OrgOptsScreen extends StatefulWidget {
  const OrgOptsScreen({super.key});
  static String id = '/idukaan/business/org/id';

  @override
  State<OrgOptsScreen> createState() => _OrgOptsScreenState();
}

class _OrgOptsScreenState extends State<OrgOptsScreen> {
  late BusinessCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false);
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

  void showOrgVerMsg() {
    if (!ctrl.org!.isVer) {
      showXDialog(
        title: 'Attention Required',
        text: ctrl.orgList!.isVerMsg,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: ctrl.org!.name,
      ),
      body: Container(
        margin: screenMargin(context),
        child: CustomScrollView(
          slivers: [
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                if (ctrl.org!.isActive)
                  OptWidget(
                    icon: OrgOptUtil.addShop.icon,
                    title: OrgOptUtil.addShop.name,
                    onTap: () {
                      showOrgVerMsg();
                    },
                  ),
                if (ctrl.org!.isActive)
                  OptWidget(
                    icon: OrgOptUtil.manageShops.icon,
                    title: OrgOptUtil.manageShops.name,
                    onTap: () {
                      showOrgVerMsg();
                    },
                  ),
                if (ctrl.org!.isActive)
                  OptWidget(
                    icon: OrgOptUtil.hR.icon,
                    title: OrgOptUtil.hR.name,
                    onTap: () {
                      showOrgVerMsg();
                    },
                  ),
                if (ctrl.org!.isActive)
                  OptWidget(
                    icon: OrgOptUtil.legal.icon,
                    title: OrgOptUtil.legal.name,
                    onTap: () {
                      showOrgVerMsg();
                    },
                  ),
                OptWidget(
                  icon: OrgOptUtil.info.icon,
                  title: OrgOptUtil.info.name,
                  onTap: () {
                    Navigator.pushNamed(context, OrgInfoScreen.id);
                  },
                ),
                OptWidget(
                  icon: OrgOptUtil.sH.icon,
                  title: OrgOptUtil.sH.name,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
