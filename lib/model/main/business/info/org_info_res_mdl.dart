
import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/info/org_info_obj_res_mdl.dart';

class OrgInfoResMdl {
  final OrgInfoObjResMdl? org;
  final ErrorMdl? error;

  OrgInfoResMdl({
    required this.org,
    required this.error,
  });

  factory OrgInfoResMdl.success(Map<String, dynamic> json) {
    return OrgInfoResMdl(
      org: OrgInfoObjResMdl.fromJson(json),
      error: null,
    );
  }

  factory OrgInfoResMdl.failed(Map<String, dynamic> json) {
    return OrgInfoResMdl(
      org: null,
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
