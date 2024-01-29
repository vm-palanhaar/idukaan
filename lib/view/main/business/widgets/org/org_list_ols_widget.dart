import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/view/main/business/screens/org/org_opts_screen.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/ctext_error_widget.dart';
import 'package:idukaan/view/widgets/loading_widget.dart';
import 'package:idukaan/view/widgets/verified_widget.dart';
import 'package:provider/provider.dart';

class OrgListOLSWidget extends StatefulWidget {
  const OrgListOLSWidget({super.key});

  @override
  State<OrgListOLSWidget> createState() => _OrgListOLSWidgetState();
}

class _OrgListOLSWidgetState extends State<OrgListOLSWidget> {
  late BusinessCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false);
    getOrgList(false);
    super.initState();
  }

  Future<void> getOrgList(bool reload) async {
    await ctrl.getOrgListApi(
      context: context,
      reload: reload,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (ctrl.orgList != null) {
      if (ctrl.orgList!.org.isNotEmpty) {
        return RefreshIndicator(
          onRefresh: () async => await getOrgList(true),
          child: Container(
            margin: screenMargin(context),
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemCount: ctrl.orgList!.org.length,
                  separatorBuilder: (context, index) {
                    if (index != ctrl.orgList!.org.length - 1) {
                      return const Divider();
                    }
                    return null;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          ctrl.orgList!.org.elementAt(index).name,
                          textDirection: TextDirection.ltr,
                        ),
                        trailing: VerifiedWidget(
                          isVer: ctrl.orgList!.org.elementAt(index).isKyo,
                        ),
                        onTap: () {
                          ctrl.org = ctrl.orgList!.org.elementAt(index);
                          Navigator.pushNamed(context, OrgOptsScreen.id);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      } else if (ctrl.orgList!.error != null) {
        return CTextErrorWidget(text: ctrl.orgList!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
