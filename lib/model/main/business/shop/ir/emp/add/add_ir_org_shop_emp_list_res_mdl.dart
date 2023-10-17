import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/emp/list/org_emp_list_sobj_res_mdl.dart';

class AddIrOrgShopEmpListResMdl {
  final String shopId;
  final String orgId;
  final String orgName;
  List<OrgEmpListSObjResMdl> emp;
  final ErrorMdl? error;

  AddIrOrgShopEmpListResMdl({
    required this.shopId,
    required this.orgId,
    required this.orgName,
    required this.emp,
    required this.error,
  });

  factory AddIrOrgShopEmpListResMdl.success(Map<String, dynamic> json) {
    var list = json['org-shop_emp_list'] as List;
    return AddIrOrgShopEmpListResMdl(
      shopId: json["shop_id"] as String,
      orgId: json["org_id"] as String,
      orgName: json["org_name"] as String,
      emp: list
          .map<OrgEmpListSObjResMdl>(
              (json) => OrgEmpListSObjResMdl.fromJson(json))
          .toList(),
      error: null,
    );
  }

  factory AddIrOrgShopEmpListResMdl.failed(Map<String, dynamic> json) {
    return AddIrOrgShopEmpListResMdl(
      shopId: json["shop_id"] as String,
      orgId: json["org_id"] as String,
      orgName: "",
      emp: [],
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
