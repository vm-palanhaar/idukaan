import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/delete/delete_ir_shop_emp_res_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/list/ir_shop_emp_list_obj_res_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/patch/update_ir_shop_emp_req_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/patch/update_ir_shop_emp_res_mdl.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/ctext_error_widget.dart';
import 'package:idukaan/view/widgets/fields/calendar_widget.dart';
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
  UpdateIrShopEmpReqMdl reqEmp = UpdateIrShopEmpReqMdl();
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

  void showSnackBar({required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  void showXDialog({
    BuildContext? mContext,
    required String title,
    Icon? icon,
    Widget? content,
    List<Widget>? actions,
  }) {
    showDialog(
      context: mContext ?? context,
      builder: (context) => AlertDialog(
        icon: icon,
        title: Text(title),
        content: content,
        actions: actions,
      ),
    );
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
              if (ctrl.irShop!.empMng)
                ListTile(
                  leading: shopEmp.isMng
                      ? const Icon(Icons.person_outlined)
                      : const Icon(Icons.manage_accounts_outlined),
                  title: const Text('Update role'),
                  subtitle: shopEmp.isMng
                      ? const Text('Employee')
                      : const Text('Manager'),
                  onTap: () {
                    reqEmp.setIsMng(!shopEmp.isMng);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        icon: const Icon(Icons.update, color: Colors.blue),
                        title: Text(
                          'Update role for ${shopEmp.name} to '
                          '${shopEmp.isMng ? 'Employee' : 'Manager'}',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              await _updateEmp(
                                title: 'Update joining date',
                                shopEmp: shopEmp,
                                index: index,
                              );
                            },
                            child: const Text('Update'),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              if (ctrl.irShop!.empMng) const Divider(),
              if (ctrl.irShop!.empMng)
                CalendarWidget(
                  title: 'Update Joining Date',
                  onTap: (String date) async {},
                  lastDate: DateTime.now(),
                ),
              if (ctrl.irShop!.empMng)
                ListTile(
                  leading: const Icon(Icons.person_remove_outlined),
                  title: const Text('Terminate'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        icon: const Icon(
                          Icons.person_remove_outlined,
                          color: Colors.red,
                        ),
                        title: Text('Terminating ${shopEmp.name}'),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              await _deleteEmp(
                                shopEmp: shopEmp,
                                index: index,
                              );
                            },
                            child: const Text('Terminate'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _updateEmp({
    required String title,
    required IrShopEmpListObjResMdl shopEmp,
    required int index,
  }) async {
    Navigator.pop(context);
    UpdateIrShopEmpResMdl? res = await ctrl.patchIrShopEmpApi(
      context: context,
      reqEmp: reqEmp,
    );
    if (res != null && res.empId == shopEmp.id) {
      if (res.emp != null) {
        setState(() {
          ctrl.irShopEmpList!.emp.elementAt(index).jDate = res.emp!.jDate;
          ctrl.irShopEmpList!.emp.elementAt(index).isMng = res.emp!.isMng;
          ctrl.irShopEmpList!.emp.elementAt(index).exp = res.emp!.exp;
        });
        showSnackBar(text: res.msg);
      } else if (res.error != null) {
        showXDialog(
          icon: const Icon(Icons.error_outlined, color: Colors.red),
          title: '$title failed',
          content: Text(res.error!.msg),
        );
      }
    }
  }

  Future<void> _deleteEmp({
    required IrShopEmpListObjResMdl shopEmp,
    required int index,
  }) async {
    Navigator.pop(context);
    DeleteIrShopEmpResMdl? res = await ctrl.deleteIrShopEmpApi(
      context: context,
      empId: shopEmp.id,
    );
    if (res != null && res.empId == shopEmp.id) {
      if (res.error != null) {
        showXDialog(
          icon: const Icon(Icons.error_outlined, color: Colors.red),
          title: 'Terminate failed',
          content: Text(res.error!.msg),
        );
      } else if (res.msg.isNotEmpty) {
        setState(() {
          ctrl.irShopEmpList!.emp.removeAt(index);
        });
        showSnackBar(text: res.msg);
      }
    }
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
                          reqEmp.setId(shopEmp.id);
                          reqEmp.setIsMng(shopEmp.isMng);
                          reqEmp.setJDate(shopEmp.jDate);
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
