import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/list/ir_shop_emp_list_obj_res_mdl.dart';

class UpdateIrShopEmpResMdl {
  final String empId;
  final String shopId;
  final IrShopEmpListObjResMdl? emp;
  final String msg;
  final ErrorMdl? error;

  UpdateIrShopEmpResMdl({
    required this.empId,
    required this.shopId,
    required this.emp,
    required this.msg,
    required this.error,
  });

  factory UpdateIrShopEmpResMdl.success(Map<String, dynamic> json) {
    return UpdateIrShopEmpResMdl(
      empId: json["id"] as String,
      shopId: json["shop_id"] as String,
      emp: IrShopEmpListObjResMdl.fromJson(json['ir_shop_emp']),
      msg: json["message"] as String,
      error: null,
    );
  }

  factory UpdateIrShopEmpResMdl.failed(Map<String, dynamic> json) {
    return UpdateIrShopEmpResMdl(
      empId: json["id"] as String,
      shopId: json["shop_id"] as String,
      emp: null,
      msg: '',
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
