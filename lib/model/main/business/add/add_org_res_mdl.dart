import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/add/add_org_sobj_res_mdl.dart';

class AddOrgResMdl {
  final AddOrgSObjResMdl? org;
  final String message;
  final ErrorMdl? error;

  AddOrgResMdl({
    required this.org,
    required this.message,
    required this.error,
  });

  factory AddOrgResMdl.success(Map<String, dynamic> json) {
    return AddOrgResMdl(
      org: AddOrgSObjResMdl.fromJson(json['orgData']),
      message: json["message"] as String,
      error: null,
    );
  }

  factory AddOrgResMdl.failed(Map<String, dynamic> json) {
    return AddOrgResMdl(
      org: null,
      message: '',
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}