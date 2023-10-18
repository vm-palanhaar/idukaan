import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/info/ir_shop_info_obj_res_mdl.dart';

class IrShopInfoResMdl {
  final String shopId;
  final IrShopInfoObjResMdl? shop;
  final ErrorMdl? error;

  IrShopInfoResMdl({
    required this.shopId,
    required this.shop,
    required this.error,
  });

  factory IrShopInfoResMdl.success(Map<String, dynamic> json) {
    return IrShopInfoResMdl(
      shopId: json["id"] as String,
      shop: IrShopInfoObjResMdl.fromJson(json['ir_shop']),
      error: null,
    );
  }

  factory IrShopInfoResMdl.failed(Map<String, dynamic> json) {
    return IrShopInfoResMdl(
      shopId: json["id"] as String,
      shop: null,
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
