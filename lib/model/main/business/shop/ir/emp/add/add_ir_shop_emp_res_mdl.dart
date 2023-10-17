import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/add/add_ir_shop_emp_obj_res_mdl.dart';

class AddIrShopEmpResMdl {
  final String shopId;
  final AddIrShopEmpObjResMdl? emp;
  final String message;
  final ErrorMdl? error;

  AddIrShopEmpResMdl({
    required this.shopId,
    required this.emp,
    required this.message,
    required this.error,
  });

  factory AddIrShopEmpResMdl.success(Map<String, dynamic> json) {
    return AddIrShopEmpResMdl(
      shopId: json['shop_id'] as String,
      emp: AddIrShopEmpObjResMdl.fromJson(json['ir_shop_emp']),
      message: json['message'] as String,
      error: null,
    );
  }

  factory AddIrShopEmpResMdl.failed(Map<String, dynamic> json) {
    return AddIrShopEmpResMdl(
      shopId: json['shop_id'] as String,
      emp: null,
      message: '',
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
