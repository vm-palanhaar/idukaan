import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/add/add_ir_shop_sobj_res_mdl.dart';

class AddIrShopResMdl {
  final String org;
  final AddIrShopSObjResMdl? irShop;
  final String message;
  final ErrorMdl? error;

  AddIrShopResMdl({
    required this.org,
    required this.irShop,
    required this.message,
    required this.error,
  });

  factory AddIrShopResMdl.success(Map<String, dynamic> json) {
    return AddIrShopResMdl(
      org: json["org"] as String,
      irShop: AddIrShopSObjResMdl.fromJson(json['ir_shop']),
      message: json["message"] as String,
      error: null,
    );
  }

  factory AddIrShopResMdl.failed(Map<String, dynamic> json) {
    return AddIrShopResMdl(
      org: json["org"] as String,
      irShop: null,
      message: '',
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
