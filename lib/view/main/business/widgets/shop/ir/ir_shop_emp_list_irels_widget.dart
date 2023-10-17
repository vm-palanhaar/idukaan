import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/list/ir_shop_emp_list_obj_res_mdl.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/ctext_error_widget.dart';
import 'package:idukaan/view/widgets/loading_widget.dart';
import 'package:idukaan/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class IrShopEmpListIRELSWidget extends StatefulWidget {
  const IrShopEmpListIRELSWidget({super.key});

  @override
  State<IrShopEmpListIRELSWidget> createState() =>
      _IrShopEmpListIRELSWidgetState();
}

class _IrShopEmpListIRELSWidgetState extends State<IrShopEmpListIRELSWidget> {
  late IrCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    getIrShopEmpList(false);
    super.initState();
  }

  Future<void> getIrShopEmpList(bool reload) async {
    await ctrl.getIrShopEmpApi(
      context: context,
      reload: reload,
    );
    setState(() {});
  }

  void _showModalBottomSheetIrShopEmp({
    required IrShopEmpListObjResMdl shopEmp,
    required int index,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListTile(
                title: Center(
                  child: TextWidget(
                    text: shopEmp.name,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  children: [
                    shopEmp.isMng
                        ? const Text('Role: Manager')
                        : const Text('Role: Employee'),
                    Text('Joining Date: ${shopEmp.jDate}'),
                    Text('Experience: ${shopEmp.exp}'),
                  ],
                ),
              ),
              if (ctrl.irShop!.empMng) const Divider(),
              //TODO: change role manager or employee
              if (ctrl.irShop!.empMng) const Divider(),
              //TODO: change joining date
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (ctrl.irShopEmpList != null) {
      if (ctrl.irShopEmpList!.emp.isNotEmpty) {
        return RefreshIndicator(
          onRefresh: () async => await getIrShopEmpList(true),
          child: Container(
            margin: screenMargin(context),
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemCount: ctrl.irShopEmpList!.emp.length,
                  separatorBuilder: (context, index) {
                    if (index != ctrl.irShopEmpList!.emp.length - 1) {
                      return const Divider();
                    }
                    return null;
                  },
                  itemBuilder: (context, index) {
                    IrShopEmpListObjResMdl shopEmp =
                        ctrl.irShopEmpList!.emp.elementAt(index);
                    return Card(
                      child: ListTile(
                        title: Text(
                          shopEmp.name,
                          textDirection: TextDirection.ltr,
                        ),
                        trailing: shopEmp.isMng
                            ? const Icon(Icons.manage_accounts_outlined)
                            : null,
                        onTap: () {
                          ctrl.updateIrShopEmp.setId(shopEmp.id);
                          ctrl.updateIrShopEmp.setIsMng(shopEmp.isMng);
                          ctrl.updateIrShopEmp.setJDate(shopEmp.jDate);
                          _showModalBottomSheetIrShopEmp(
                            shopEmp: shopEmp,
                            index: index,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      } else if (ctrl.irShopEmpList!.error != null) {
        return CTextErrorWidget(text: ctrl.irShopEmpList!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
