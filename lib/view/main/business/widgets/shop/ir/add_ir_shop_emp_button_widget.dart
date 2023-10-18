import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/model/main/business/emp/list/org_emp_list_sobj_res_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/add/add_ir_shop_emp_req_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/add/add_ir_shop_emp_res_mdl.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/calendar_widget.dart';
import 'package:idukaan/view/widgets/fields/switch_widget.dart';
import 'package:idukaan/view/widgets/text_error_widget.dart';
import 'package:provider/provider.dart';

class AddIrShopEmpButtonWidget extends StatefulWidget {
  final OrgEmpListSObjResMdl irOrgShopEmp;
  final int index;
  final ExpansionTileController controller;
  final Function onExpansionChanged;
  const AddIrShopEmpButtonWidget({
    super.key,
    required this.irOrgShopEmp,
    required this.index,
    required this.controller,
    required this.onExpansionChanged,
  });

  @override
  State<AddIrShopEmpButtonWidget> createState() =>
      _AddIrShopEmpButtonWidgetState();
}

class _AddIrShopEmpButtonWidgetState extends State<AddIrShopEmpButtonWidget> {
  late IrCtrl ctrl;
  AddIrShopEmpReqMdl addIrShopEmp = AddIrShopEmpReqMdl();
  bool _errorIsJDate = false;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    super.initState();
  }

  bool _validateFormAddOrgShopEmp() {
    if (addIrShopEmp.getJDate.isEmpty) {
      setState(() {
        _errorIsJDate = true;
      });
      return false;
    }
    setState(() {
      _errorIsJDate = false;
    });
    return true;
  }

  void _successResponse(String message) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _failedResponse(String message) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Onboarding Failed'),
          content: Text('Welcome, Manager! To streamline your '
              'onboarding process, please select an employee from '
              'the list to bring them on board at your '
              'stall. Your choice plays a vital role in building '
              'a dynamic team. Let\'s get started!'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        controller: widget.controller,
        onExpansionChanged: (bool value) {
          setState(() {
            _errorIsJDate = false;
          });
          addIrShopEmp.setInitValues();
          widget.onExpansionChanged(value);
        },
        title: Text(
          widget.irOrgShopEmp.name,
          textDirection: TextDirection.ltr,
        ),
        children: [
          ListTile(
            title: Text(ctrl.addIrOrgShopEmpList!.orgName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.irOrgShopEmp.isMng
                    ? const Text('Role: Manager')
                    : const Text('Role: Employee'),
                Text('Joining Date: ${widget.irOrgShopEmp.jDate}'),
                Text('Experience: ${widget.irOrgShopEmp.exp}'),
              ],
            ),
          ),
          SwitchWidget(
            icon: Icons.manage_accounts_outlined,
            text: 'Manager',
            defaultValue: addIrShopEmp.getIsMng,
            onChanged: (bool value) {
              setState(() {
                addIrShopEmp.setIsMng(value);
              });
            },
          ),
          if (_errorIsJDate) const TextErrorWidget(text: 'Joining Date !'),
          CalendarWidget(
            title: 'Joining Date',
            onTap: addIrShopEmp.setJDate,
            startDate: DateTime.parse(widget.irOrgShopEmp.jDate),
            lastDate: DateTime.now(),
          ),
          ElevatedButtonWidget(
            title: 'Onboard',
            onPressed: () async {
              addIrShopEmp.setOrgEmpId(widget.irOrgShopEmp.id);
              _validateFormAddOrgShopEmp();
              AddIrShopEmpResMdl? res = await ctrl.postIrOrgShopEmpApi(
                context: context,
                reqEmp: addIrShopEmp,
              );
              if (res != null) {
                if (res.emp != null) {
                  _successResponse(res.message);
                } else if (res.error != null) {
                  _failedResponse(res.error!.msg);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
