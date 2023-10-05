import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/emp/add/add_org_emp_sobj_res_mdl.dart';

class AddOrgEmpResMdl {
  final String orgId;
  final AddOrgEmpSObjResMdl? orgEmp;
  final String message;
  final ErrorMdl? error;

  AddOrgEmpResMdl({
    required this.orgId,
    required this.orgEmp,
    required this.message,
    required this.error,
  });
  factory AddOrgEmpResMdl.success(Map<String, dynamic> json) {
    return AddOrgEmpResMdl(
      orgId: json['org_id'] as String,
      orgEmp: AddOrgEmpSObjResMdl.fromJson(json['org_emp']),
      message: json['message'] as String,
      error: null,
    );
  }

  factory AddOrgEmpResMdl.failed(Map<String, dynamic> json) {
    return AddOrgEmpResMdl(
      orgId: json['org_id'] as String,
      orgEmp: null,
      message: '',
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
