import 'package:idukaan/model/error_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/list/ir_shop_list_obj_res_mdl.dart';

class IrShopListResMdl {
  final String orgId;
  final List<IrShopListObjResMdl> irShop;
  final ErrorMdl? error;

  IrShopListResMdl({
    required this.orgId,
    required this.irShop,
    required this.error,
  });

  factory IrShopListResMdl.success(Map<String, dynamic> json) {
    var list = json['ir_shops'] as List;
    return IrShopListResMdl(
      orgId: json['org'] as String,
      irShop: list.map<IrShopListObjResMdl>(
        (json) {
          return IrShopListObjResMdl.fromJson(json);
        },
      ).toList(),
      error: null,
    );
  }

  factory IrShopListResMdl.failed(Map<String, dynamic> json) {
    return IrShopListResMdl(
      orgId: json['org'] as String,
      irShop: [],
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
