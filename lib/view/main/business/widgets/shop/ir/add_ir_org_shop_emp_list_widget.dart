import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/model/main/business/emp/list/org_emp_list_sobj_res_mdl.dart';
import 'package:idukaan/view/main/business/widgets/shop/ir/add_ir_shop_emp_button_widget.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/ctext_error_widget.dart';
import 'package:idukaan/view/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class AddIrOrgShopEmpListWidget extends StatefulWidget {
  const AddIrOrgShopEmpListWidget({super.key});

  @override
  State<AddIrOrgShopEmpListWidget> createState() =>
      _AddIrOrgShopEmpListWidgetState();
}

class _AddIrOrgShopEmpListWidgetState extends State<AddIrOrgShopEmpListWidget> {
  late IrCtrl irCtrl;
  List<ExpansionTileController> expCtrl = [];

  @override
  void initState() {
    irCtrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    getIrOrgShopEmpList();
    super.initState();
  }

  Future<void> getIrOrgShopEmpList() async {
    await irCtrl.getIrOrgShopEmpApi(
      context: context,
    );
    if (irCtrl.addIrOrgShopEmpList != null &&
        irCtrl.addIrOrgShopEmpList!.emp.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                icon: Icon(Icons.info_outline),
                title: Text('Onboarding Process'),
                content: Text('Welcome, Manager! To streamline your '
                    'onboarding process, please select an employee from '
                    'the list to bring them on board at your '
                    'stall. Your choice plays a vital role in building '
                    'a dynamic team. Let\'s get started!'),
              );
            },
          );
        },
      );
      for (int i = 0; i < irCtrl.addIrOrgShopEmpList!.emp.length; i++) {
        expCtrl.add(ExpansionTileController());
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (irCtrl.addIrOrgShopEmpList != null) {
      if (irCtrl.addIrOrgShopEmpList!.emp.isNotEmpty) {
        return RefreshIndicator(
          onRefresh: () async => await getIrOrgShopEmpList(),
          child: Container(
            margin: screenMargin(context),
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemCount: irCtrl.addIrOrgShopEmpList!.emp.length,
                  separatorBuilder: (context, index) {
                    if (index != irCtrl.addIrOrgShopEmpList!.emp.length - 1) {
                      return const Divider();
                    }
                    return null;
                  },
                  itemBuilder: (context, index) {
                    OrgEmpListSObjResMdl orgEmp =
                        irCtrl.addIrOrgShopEmpList!.emp.elementAt(index);
                    return AddIrShopEmpButtonWidget(
                      irOrgShopEmp: orgEmp,
                      index: index,
                      controller: expCtrl.elementAt(index),
                      onExpansionChanged: (bool value) {
                        for (int i = 0;
                            i < irCtrl.addIrOrgShopEmpList!.emp.length;
                            i++) {
                          if (index == i) {
                            if (value) {
                              expCtrl[i].expand();
                            } else {
                              expCtrl[i].collapse();
                            }
                          } else {
                            if (value) {
                              expCtrl[i].collapse();
                            }
                          }
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      } else if (irCtrl.addIrOrgShopEmpList!.error != null) {
        return CTextErrorWidget(text: irCtrl.addIrOrgShopEmpList!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
