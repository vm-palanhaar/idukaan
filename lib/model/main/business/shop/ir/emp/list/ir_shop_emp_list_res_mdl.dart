import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/list/ir_shop_emp_list_obj_res_mdl.dart';

class IrShopEmpListResMdl {
  final String shopId;
  List<IrShopEmpListObjResMdl> emp;
  final ErrorMdl? error;

  IrShopEmpListResMdl({
    required this.shopId,
    required this.emp,
    required this.error,
  });

  factory IrShopEmpListResMdl.success(Map<String, dynamic> json) {
    var list = json['ir_shop_emp_list'] as List;
    return IrShopEmpListResMdl(
      shopId: json["shop_id"] as String,
      emp: list
          .map<IrShopEmpListObjResMdl>(
              (json) => IrShopEmpListObjResMdl.fromJson(json))
          .toList(),
      error: null,
    );
  }

  factory IrShopEmpListResMdl.failed(Map<String, dynamic> json) {
    return IrShopEmpListResMdl(
      shopId: json["shop_id"] as String,
      emp: [],
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
