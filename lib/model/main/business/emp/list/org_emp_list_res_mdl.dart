import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/emp/list/org_emp_list_sobj_res_mdl.dart';

class OrgEmpListResMdl {
  final String orgId;
  List<OrgEmpListSObjResMdl> emp;
  final ErrorMdl? error;

  OrgEmpListResMdl({
    required this.orgId,
    required this.emp,
    required this.error,
  });

  factory OrgEmpListResMdl.success(Map<String, dynamic> json) {
    var list = json['org_emp_list'] as List;
    return OrgEmpListResMdl(
      orgId: json["org_id"] as String,
      emp: list
          .map<OrgEmpListSObjResMdl>(
              (json) => OrgEmpListSObjResMdl.fromJson(json))
          .toList(),
      error: null,
    );
  }

  factory OrgEmpListResMdl.failed(Map<String, dynamic> json) {
    return OrgEmpListResMdl(
      orgId: json["orgId"] as String,
      emp: [],
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
