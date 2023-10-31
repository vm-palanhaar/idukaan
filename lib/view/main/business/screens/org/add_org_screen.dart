import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/model/main/business/add/org_types_mdl.dart';
import 'package:idukaan/view/util/app_bar.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/buttons/elevated_button_widget.dart';
import 'package:idukaan/view/widgets/fields/pick_file_widget.dart';
import 'package:idukaan/view/widgets/fields/textformfield_widget.dart';
import 'package:idukaan/view/widgets/list_tile_error_widget.dart';
import 'package:idukaan/view/widgets/text_error_widget.dart';
import 'package:provider/provider.dart';

class AddOrgScreen extends StatefulWidget {
  const AddOrgScreen({super.key});
  static String id = '/idukaan/business/org/add';

  @override
  State<AddOrgScreen> createState() => _AddOrgScreenState();
}

class _AddOrgScreenState extends State<AddOrgScreen> {
  final _addOrgKey = GlobalKey<FormState>();
  bool _errorIsDoc = false;

  late BusinessCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false);
    ctrl.addOrg.setInitValues();
    ctrl.addOrgRes = null;
    super.initState();
    getOrgTypesApi();
  }

  void getOrgTypesApi() async {
    await ctrl.getOrgTypesApi(
      context: context,
    );
    setState(() {});
  }

  bool _validateFormAddOrg() {
    if (ctrl.addOrg.getType.isDoc && ctrl.addOrg.getDoc.isEmpty) {
      setState(() {
        _errorIsDoc = true;
      });
      return false;
    }
    setState(() {
      _errorIsDoc = false;
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
  }

  void _successResponse() {
    showXDialog(
      title: 'Congratulations',
      text: ctrl.addOrgRes!.message,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Add Business Enterprise',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Form(
            key: _addOrgKey,
            child: Column(
              children: <Widget>[
                if (ctrl.addOrgRes != null && ctrl.addOrgRes!.error != null)
                  Card(
                    child: ListTileErrorWidget(
                      title: '! Attention Required !',
                      subtitle: ctrl.addOrgRes!.error!.msg,
                    ),
                  ),
                TextFormFieldWidget(
                  prefixIcon: Icons.business_outlined,
                  keyboardType: TextInputType.name,
                  labelText: 'Enterprise Name',
                  onFieldSubmitted: ctrl.addOrg.setName,
                ),
                if (ctrl.orgTypeList.isNotEmpty)
                  ListTile(
                    leading: const Icon(Icons.business_outlined),
                    title: const Text('Type of Business Enterprise'),
                    subtitle: DropdownButtonFormField(
                      value: ctrl.addOrg.getType,
                      items: ctrl.orgTypeList
                          .map<DropdownMenuItem<OrgTypesMdl>>(
                              (OrgTypesMdl value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.entity),
                        );
                      }).toList(),
                      onChanged: (OrgTypesMdl? selection) async {
                        ctrl.addOrg.setType(selection!);
                        setState(() {});
                      },
                    ),
                  ),
                if (ctrl.orgTypeList.isNotEmpty)
                  ListTile(
                    title: const Text('Note'),
                    subtitle: Text(ctrl.addOrg.getType.desc),
                  ),
                if (ctrl.orgTypeList.isNotEmpty)
                  ListTile(
                    title: const Text('Document'),
                    subtitle: Text(ctrl.addOrg.getType.docType),
                  ),
                if (ctrl.orgTypeList.isNotEmpty)
                  TextFormFieldWidget(
                    prefixIcon: Icons.confirmation_num_outlined,
                    keyboardType: TextInputType.name,
                    labelText: ctrl.addOrg.getType.docNo,
                    onFieldSubmitted: ctrl.addOrg.setRegNo,
                  ),
                if (_errorIsDoc) const TextErrorWidget(text: 'Document !'),
                if (ctrl.orgTypeList.isNotEmpty && ctrl.addOrg.getType.isDoc)
                  PickFileWidget(
                    icon: Icons.file_present_outlined,
                    labelText: 'Document (.pdf)',
                    onPressed: ctrl.addOrg.setDoc,
                  ),
                ElevatedButtonWidget(
                  title: 'Submit',
                  onPressed: () async {
                    _validateFormAddOrg();
                    if (_addOrgKey.currentState!.validate()) {
                      if (_validateFormAddOrg()) {
                        await ctrl.postOrgApi(context: context);
                        if (ctrl.addOrgRes != null) {
                          if (ctrl.addOrgRes!.org != null &&
                              ctrl.addOrgRes!.message.isNotEmpty) {
                            _successResponse();
                          } else {
                            setState(() {});
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
