import 'package:idukaan/model/error_mdl.dart';

class DeleteIrShopEmpResMdl {
  final String empId;
  final String shopId;
  final String msg;
  final ErrorMdl? error;

  DeleteIrShopEmpResMdl({
    required this.empId,
    required this.shopId,
    required this.msg,
    required this.error,
  });

  factory DeleteIrShopEmpResMdl.success(Map<String, dynamic> json) {
    return DeleteIrShopEmpResMdl(
      empId: json["id"] as String,
      shopId: json["shop_id"] as String,
      msg: json["message"] as String,
      error: null,
    );
  }

  factory DeleteIrShopEmpResMdl.failed(Map<String, dynamic> json) {
    return DeleteIrShopEmpResMdl(
      empId: json["id"] as String,
      shopId: json["shop_id"] as String,
      msg: '',
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
