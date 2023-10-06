import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/calendar_widget.dart';
import 'package:idukaan/view/widgets/fields/switch_widget.dart';
import 'package:idukaan/view/widgets/fields/text_form_field_widget.dart';
import 'package:idukaan/view/widgets/text_error_widget.dart';
import 'package:provider/provider.dart';

class AddOrgEmpScreen extends StatefulWidget {
  const AddOrgEmpScreen({super.key});
  static String id = '/idukaan/business/org/id/emp/add';

  @override
  State<AddOrgEmpScreen> createState() => _AddOrgEmpScreenState();
}

class _AddOrgEmpScreenState extends State<AddOrgEmpScreen> {
  final _addOrgEmpKey = GlobalKey<FormState>();
  bool _errorIsJDate = false;

  late BusinessCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false);
    ctrl.addOrgEmp.setInitValues();
    ctrl.addOrgEmpRes = null;
    super.initState();
  }

  bool _validateFormAddOrgEmp() {
    if (ctrl.addOrgEmp.getJDate.isEmpty) {
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
    Navigator.pop(context);
  }

  void _successResponse() {
    showXDialog(
      title: 'Successful Onboarding',
      text: ctrl.addOrgEmpRes!.message,
    );
  }

  void _failedResponse() {
    showXDialog(
      title: 'Onboarding Failed',
      text: ctrl.addOrgEmpRes!.error!.msg,
    );
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
                if (_errorIsJDate)
                  const TextErrorWidget(text: 'Joining Date !'),
                CalendarWidget(
                  title: 'Joining Date',
                  onTap: ctrl.addOrgEmp.setJDate,
                ),
                ElevatedButtonWidget(
                  title: 'Onboard',
                  onPressed: () async {
                    _validateFormAddOrgEmp();
                    if (_addOrgEmpKey.currentState!.validate()) {
                      if (_validateFormAddOrgEmp()) {
                        await ctrl.postOrgEmpApi(context: context);
                        if (ctrl.addOrgEmpRes != null &&
                            ctrl.org!.id == ctrl.addOrgEmpRes!.orgId) {
                          if (ctrl.addOrgEmpRes!.orgEmp != null &&
                              ctrl.addOrgEmpRes!.message.isNotEmpty) {
                            _successResponse();
                          } else if (ctrl.addOrgEmpRes!.error != null) {
                            _failedResponse();
                          }
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
