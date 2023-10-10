import 'package:idukaan/model/main/business/shop/ir/add/add_ir_shop_req_1_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/add/add_ir_shop_req_3_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/add/add_ir_shop_req_2_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/add/add_ir_shop_req_4_mdl.dart';

class AddIrShopReqMdl {
  String _org = '';

  void setOrg(String org) => _org = org;

  String get getOrg => _org;

  AddIrShopReq1Mdl addIrShop1 = AddIrShopReq1Mdl();
  AddIrShopReq2Mdl addIrShop2 = AddIrShopReq2Mdl();
  AddIrShopReq3Mdl addIrShop3 = AddIrShopReq3Mdl();
  AddIrShopReq4Mdl addIrShop4 = AddIrShopReq4Mdl();

  void setInitValues() {
    _org = '';
    addIrShop1.setInitValues();
    addIrShop2.setInitValues();
    addIrShop3.setInitValues();
    addIrShop4.setInitValues();
  }
}
