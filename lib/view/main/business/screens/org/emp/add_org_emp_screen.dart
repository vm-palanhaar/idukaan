import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/switch_widget.dart';
import 'package:idukaan/view/widgets/fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

class AddOrgEmpScreen extends StatefulWidget {
  const AddOrgEmpScreen({super.key});
  static String id = '/idukaan/business/org/id/emp/add';

  @override
  State<AddOrgEmpScreen> createState() => _AddOrgEmpScreenState();
}

class _AddOrgEmpScreenState extends State<AddOrgEmpScreen> {
  final _addOrgEmpKey = GlobalKey<FormState>();
  late BusinessCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false);
    ctrl.addOrgEmpRes = null;
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

  void _successResponse() {
    showXDialog(
      title: 'Successful Onboarding',
      text: ctrl.addOrgEmpRes!.message,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Employee Onboarding',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Form(
            key: _addOrgEmpKey,
            child: Column(
              children: <Widget>[
                TextFormFieldWidget(
                  prefixIcon: Icons.verified_user_outlined,
                  keyboardType: TextInputType.name,
                  labelText: 'Username (Employee)',
                  onFieldSubmitted: ctrl.addOrgEmp.setUser,
                ),
                SwitchWidget(
                  icon: Icons.manage_accounts_outlined,
                  text: 'Manager',
                  defaultValue: ctrl.addOrgEmp.getIsMngBool,
                  onChanged: (bool value) {
                    setState(() {
                      ctrl.addOrgEmp.setIsMng(value);
                    });
                  },
                ),
                ElevatedButtonWidget(
                  title: 'Onboard',
                  onPressed: () async {
                    if (_addOrgEmpKey.currentState!.validate()) {
                      await ctrl.postOrgEmpApi(context: context);
                      if (ctrl.addOrgEmpRes != null &&
                          ctrl.org!.id == ctrl.addOrgEmpRes!.orgId) {
                        if (ctrl.addOrgEmpRes!.orgEmp != null &&
                            ctrl.addOrgEmpRes!.message.isNotEmpty) {
                          _successResponse();
                        } else if (ctrl.addOrgEmpRes!.error != null) {
                          //TODO: show alert dialog and move back to screen
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
