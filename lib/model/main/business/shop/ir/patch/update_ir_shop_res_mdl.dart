import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/patch/update_ir_shop_obj_res_mdl.dart';

class UpdateIrShopResMdl {
  final String shopId;
  final UpdateIrShopObjResMdl? shop;
  final ErrorMdl? error;

  UpdateIrShopResMdl({
    required this.shopId,
    required this.shop,
    required this.error,
  });

  factory UpdateIrShopResMdl.success(Map<String, dynamic> json) {
    return UpdateIrShopResMdl(
      shopId: json["id"] as String,
      shop: UpdateIrShopObjResMdl.fromJson(json['ir_shop']),
      error: null,
    );
  }

  factory UpdateIrShopResMdl.failed(Map<String, dynamic> json) {
    return UpdateIrShopResMdl(
      shopId: json["id"] as String,
      shop: null,
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
