import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/model/main/business/emp/list/org_emp_list_sobj_res_mdl.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/ctext_error_widget.dart';
import 'package:idukaan/view/widgets/fields/calendar_widget.dart';
import 'package:idukaan/view/widgets/loading_widget.dart';
import 'package:idukaan/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class OrgEmpListOELSWidget extends StatefulWidget {
  const OrgEmpListOELSWidget({super.key});

  @override
  State<OrgEmpListOELSWidget> createState() => _OrgEmpListOELSWidgetState();
}

class _OrgEmpListOELSWidgetState extends State<OrgEmpListOELSWidget> {
  late BusinessCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<BusinessCtrl>(context, listen: false);
    getOrgEmpList(false);
    super.initState();
  }

  Future<void> getOrgEmpList(bool reload) async {
    await ctrl.getOrgEmpListApi(
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

  void _showModalBottomSheetOrgEmp({
    required OrgEmpListSObjResMdl orgEmp,
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
                    text: orgEmp.name,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  children: [
                    orgEmp.isMng
                        ? const Text('Role: Manager')
                        : const Text('Role: Employee'),
                    Text('Joining Date: ${orgEmp.jDate}'),
                    Text('Experience: ${orgEmp.exp}'),
                  ],
                ),
              ),
              if (ctrl.org!.empMng) const Divider(),
              if (ctrl.org!.empMng)
                ListTile(
                  leading: orgEmp.isMng
                      ? const Icon(Icons.person_outlined)
                      : const Icon(Icons.manage_accounts_outlined),
                  title: const Text('Update role'),
                  subtitle: orgEmp.isMng
                      ? const Text('Employee')
                      : const Text('Manager'),
                  onTap: () async {
                    ctrl.updateOrgEmp.setIsMng(!orgEmp.isMng);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        icon: const Icon(Icons.update, color: Colors.blue),
                        title: Text(
                          'Update role for ${orgEmp.name} to '
                          '${orgEmp.isMng ? 'Employee' : 'Manager'}',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              await _updateEmp(
                                title: 'Update role',
                                orgEmp: orgEmp,
                                index: index,
                              );
                            },
                            child: const Text('Update'),
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
              if (ctrl.org!.empMng) const Divider(),
              if (ctrl.org!.empMng)
                CalendarWidget(
                  title: 'Update joining date',
                  onTap: (String date) async {
                    ctrl.updateOrgEmp.setJDate(date);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        icon: const Icon(Icons.update, color: Colors.blue),
                        title: Text(
                          'Update joining date for ${orgEmp.name} to '
                          '${ctrl.updateOrgEmp.getJDate}',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              await _updateEmp(
                                title: 'Update joining date',
                                orgEmp: orgEmp,
                                index: index,
                              );
                            },
                            child: const Text('Update'),
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
                  lastDate: DateTime.now(),
                ),
              if (ctrl.org!.empMng) const Divider(),
              if (ctrl.org!.empMng)
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
                        title: Text('Terminating ${orgEmp.name}'),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              await _deleteEmp(
                                orgEmp: orgEmp,
                                index: index,
                              );
                            },
                            child: const Text('Update'),
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
    required OrgEmpListSObjResMdl orgEmp,
    required int index,
  }) async {
    Navigator.pop(context);
    await ctrl.patchOrgEmpApi(context: context);
    if (ctrl.updateOrgEmpRes != null &&
        ctrl.updateOrgEmpRes!.empId == orgEmp.id) {
      if (ctrl.updateOrgEmpRes!.emp != null) {
        setState(() {
          ctrl.orgEmpList!.emp.elementAt(index).jDate =
              ctrl.updateOrgEmpRes!.emp!.jDate;
          ctrl.orgEmpList!.emp.elementAt(index).isMng =
              ctrl.updateOrgEmpRes!.emp!.isMng;
          ctrl.orgEmpList!.emp.elementAt(index).exp =
              ctrl.updateOrgEmpRes!.emp!.exp;
        });
        showSnackBar(text: ctrl.updateOrgEmpRes!.msg);
      } else if (ctrl.updateOrgEmpRes!.error != null) {
        showXDialog(
          icon: const Icon(Icons.error_outlined, color: Colors.red),
          title: '$title failed',
          content: Text(ctrl.updateOrgEmpRes!.error!.msg),
        );
      }
    }
    ctrl.updateOrgEmpRes = null;
  }

  Future<void> _deleteEmp({
    required OrgEmpListSObjResMdl orgEmp,
    required int index,
  }) async {
    Navigator.pop(context);
    await ctrl.deleteOrgEmpApi(context: context, empId: orgEmp.id);
    if (ctrl.deleteOrgEmpRes != null &&
        ctrl.deleteOrgEmpRes!.empId == orgEmp.id) {
      if (ctrl.deleteOrgEmpRes!.error != null) {
        showXDialog(
          icon: const Icon(Icons.error_outlined, color: Colors.red),
          title: 'Terminate failed',
          content: Text(ctrl.deleteOrgEmpRes!.error!.msg),
        );
      } else if (ctrl.deleteOrgEmpRes!.msg.isNotEmpty) {
        setState(() {
          ctrl.orgEmpList!.emp.removeAt(index);
        });
        showSnackBar(text: ctrl.deleteOrgEmpRes!.msg);
      }
    }
    ctrl.deleteOrgEmpRes = null;
  }

  @override
  Widget build(BuildContext context) {
    if (ctrl.orgEmpList != null) {
      if (ctrl.orgEmpList!.emp.isNotEmpty) {
        return RefreshIndicator(
          onRefresh: () async => await getOrgEmpList(true),
          child: Container(
            margin: screenMargin(context),
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemCount: ctrl.orgEmpList!.emp.length,
                  separatorBuilder: (context, index) {
                    if (index != ctrl.orgEmpList!.emp.length - 1) {
                      return const Divider();
                    }
                    return null;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    OrgEmpListSObjResMdl orgEmp =
                        ctrl.orgEmpList!.emp.elementAt(index);
                    return Card(
                      child: ListTile(
                        title: Text(
                          orgEmp.name,
                          textDirection: TextDirection.ltr,
                        ),
                        trailing: orgEmp.isMng
                            ? const Icon(Icons.manage_accounts_outlined)
                            : null,
                        onTap: () {
                          ctrl.updateOrgEmp.setId(orgEmp.id);
                          ctrl.updateOrgEmp.setIsMng(orgEmp.isMng);
                          ctrl.updateOrgEmp.setJDate(orgEmp.jDate);
                          _showModalBottomSheetOrgEmp(
                              orgEmp: orgEmp, index: index);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      } else if (ctrl.orgEmpList!.error != null) {
        return CTextErrorWidget(text: ctrl.orgEmpList!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
