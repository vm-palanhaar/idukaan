import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/model/main/business/emp/list/org_emp_list_sobj_res_mdl.dart';
import 'package:idukaan/view/util/margins.dart';
import 'package:idukaan/view/widgets/ctext_error_widget.dart';
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
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.27,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ListTile(
                                      title: Center(
                                        child: TextWidget(
                                          text: orgEmp.name,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Column(
                                        children: [
                                          Text('Joining Date: ${orgEmp.jDate}'),
                                          Text('Experience: ${orgEmp.exp}'),
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      leading:
                                          const Icon(Icons.settings_outlined),
                                      title: const Text('Settings'),
                                      subtitle: Text(
                                          'Update Role, Update Joining Date, Terminate ${orgEmp.name}...'),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              );
                            },
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
      } else if (ctrl.orgEmpList!.error != null) {
        return CTextErrorWidget(text: ctrl.orgEmpList!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
