import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/emp/list/org_emp_list_sobj_res_mdl.dart';

class UpdateOrgEmpResMdl {
  final String empId;
  final String orgId;
  final OrgEmpListSObjResMdl? emp;
  final String msg;
  final ErrorMdl? error;

  UpdateOrgEmpResMdl({
    required this.empId,
    required this.orgId,
    required this.emp,
    required this.msg,
    required this.error,
  });

  factory UpdateOrgEmpResMdl.success(Map<String, dynamic> json) {
    return UpdateOrgEmpResMdl(
      empId: json["id"] as String,
      orgId: json["org_id"] as String,
      emp: OrgEmpListSObjResMdl.fromJson(json['org_emp']),
      msg: json["message"] as String,
      error: null,
    );
  }

  factory UpdateOrgEmpResMdl.failed(Map<String, dynamic> json) {
    return UpdateOrgEmpResMdl(
      empId: json["id"] as String,
      orgId: json["org_id"] as String,
      emp: null,
      msg: '',
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
