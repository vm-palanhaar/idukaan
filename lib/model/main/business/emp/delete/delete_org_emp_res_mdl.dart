import 'package:idukaan/model/error_mdl.dart';

class DeleteOrgEmpResMdl {
  final String empId;
  final String orgId;
  final String msg;
  final ErrorMdl? error;

  DeleteOrgEmpResMdl({
    required this.empId,
    required this.orgId,
    required this.msg,
    required this.error,
  });

  factory DeleteOrgEmpResMdl.success(Map<String, dynamic> json) {
    return DeleteOrgEmpResMdl(
      empId: json["id"] as String,
      orgId: json["org_id"] as String,
      msg: json["message"] as String,
      error: null,
    );
  }

  factory DeleteOrgEmpResMdl.failed(Map<String, dynamic> json) {
    return DeleteOrgEmpResMdl(
      empId: json["id"] as String,
      orgId: json["org_id"] as String,
      msg: '',
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
