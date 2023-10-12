import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:idukaan/controller/handle_errors_api.dart';
import 'package:idukaan/controller/rest_api.dart';
import 'package:idukaan/model/main/business/shop/ir/add/add_ir_shop_req_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/add/add_ir_shop_res_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/list/ir_shop_list_res_mdl.dart';
import 'package:idukaan/model/main/ir/ir_station_list_mdl.dart';

class IrCtrlApi extends HandleErrorsApi {
  late String _token;
  void setToken(String token) => _token = token;

  Future<IrStationListMdl?> getStationListApi({
    required BuildContext context,
    required bool showError,
  }) async {
    super.context = context;
    super.showError = showError;
    IrStationListMdl? res;
    if (await checkInternetConnectivity()) {
      var response = await http.get(
        Uri.parse(IrApiUri.stations.uri),
      );
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        res = IrStationListMdl.fromJson(json);
      }
      //TODO: Handle errors if not response not serialized
    }
    return res;
  }

  Future<AddIrShopResMdl?> postIrShopApi({
    required BuildContext context,
    required bool showError,
    required AddIrShopReqMdl req,
  }) async {
    super.context = context;
    super.showError = showError;
    AddIrShopResMdl? res;
    if (await checkInternetConnectivity()) {
      var uri = IrApiUri.addShop.uri;
      uri = uri.replaceAll("<orgId>", req.getOrg);
      var request = http.MultipartRequest('POST', Uri.parse(uri));
      request.headers['Authorization'] = 'Token $_token';
      request.fields['org'] = req.getOrg;
      // screen 1
      request.fields['name'] = req.addIrShop1.getName;
      request.fields['shop_no'] = req.addIrShop1.getShopNo;
      request.fields['contact_no'] = req.addIrShop1.getContactNo;
      request.files.add(await http.MultipartFile.fromPath(
        "img",
        req.addIrShop1.getImg,
        filename: '${req.addIrShop1.getShopNo}.png',
      ));
      // screen 2
      request.fields['is_cash'] = req.addIrShop2.getIsCash.toString();
      request.fields['is_upi'] = req.addIrShop2.getIsUpi.toString();
      request.fields['is_card'] = req.addIrShop2.getIsCard.toString();
      // screen 3
      request.fields['station'] = req.addIrShop3.getStation;
      request.fields['plt1'] = req.addIrShop3.getPlt1;
      request.fields['plt2'] = req.addIrShop3.getPlt2;
      request.fields['lat'] = req.addIrShop3.getLat;
      request.fields['lon'] = req.addIrShop3.getLon;
      // screen 4
      request.fields['lic_no'] = req.addIrShop4.getLicNo;
      request.files.add(await http.MultipartFile.fromPath(
        "lic_doc",
        req.addIrShop4.getLicDoc,
        filename: '${req.addIrShop1.getShopNo}.pdf',
      ));
      request.fields['lic_sd'] = req.addIrShop4.getLicSd;
      request.fields['lic_ed'] = req.addIrShop4.getLicEd;

      var response = await request.send();
      var resData = await response.stream.toBytes();
      var resDecode = jsonDecode(String.fromCharCodes(resData));
      if (response.statusCode == 201) {
        res = AddIrShopResMdl.success(resDecode);
      } else if (response.statusCode == 400 ||
          response.statusCode == 403 ||
          response.statusCode == 409) {
        res = AddIrShopResMdl.failed(resDecode);
      }
      //TODO: Handle errors if not response not serialized
    }
    return res;
  }

  Future<IrShopListResMdl?> getIrOrgShopsApi({
    required BuildContext context,
    required bool showError,
    required String orgId,
  }) async {
    super.context = context;
    super.showError = showError;
    IrShopListResMdl? res;
    if (await checkInternetConnectivity()) {
      var uri = IrApiUri.orgShops.uri;
      uri = uri.replaceAll("<orgId>", orgId);
      var response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Token $_token',
        },
      );
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        res = IrShopListResMdl.success(json);
      } else if (response.statusCode == 400 || response.statusCode == 403) {
        res = IrShopListResMdl.failed(json);
      }
      //TODO: Handle errors if not response not serialized
    }
    return res;
  }
}
