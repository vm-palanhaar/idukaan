const String baseUrlApi = 'http://192.168.29.176:8000/api';

//---Users---
enum UserApiUri {
  //PROD
  signup(uri: '$baseUrlApi/user/v1/signup'),
  login(uri: '$baseUrlApi/user/v1/login'),
  validate(uri: '$baseUrlApi/user/v1/validate'),
  logout(uri: '$baseUrlApi/user/v1/logout'),
  logoutAll(uri: '$baseUrlApi/user/v1/logoutAll'),
  //DEV
  doNotUse(uri: '');

  const UserApiUri({
    required this.uri,
  });

  final String uri;
}

//---BusinessApp---
const String baseUrlApiBusAppV1 = '$baseUrlApi/idukaan/business/v1';

enum BusinessApiUri {
  //PROD
  orgTypes(uri: '$baseUrlApiBusAppV1/org/type'),
  addOrg(uri: '$baseUrlApiBusAppV1/org'),
  orgList(uri: '$baseUrlApiBusAppV1/org'),
  orgInfo(uri: '$baseUrlApiBusAppV1/org/<orgId>'),
  addOrgEmp(uri: '$baseUrlApiBusAppV1/org/<orgId>/emp'),
  orgEmpList(uri: '$baseUrlApiBusAppV1/org/<orgId>/emp'),
  deleteOrgEmp(uri: '$baseUrlApiBusAppV1/org/<orgId>/emp/<orgEmpId>'),
  patchOrgEmp(uri: '$baseUrlApiBusAppV1/org/<orgId>/emp/<orgEmpId>'),
  //DEV
  doNotUse(uri: '');

  const BusinessApiUri({
    required this.uri,
  });

  final String uri;
}

//---IndianRailwaysApp---
const String baseUrlApiIrV1 = '$baseUrlApi/ir/v1';
const String baseUrlApiIrAppV1 = '$baseUrlApi/idukaan/ir/v1';

enum IrApiUri {
  //PROD
  stations(uri: '$baseUrlApiIrV1/stations'),
  addShop(uri: '$baseUrlApiIrAppV1/org/<orgId>/shop'),
  orgShops(uri: '$baseUrlApiIrAppV1/org/<orgId>/shop'),
  shopInfo(uri: '$baseUrlApiIrAppV1/org/<orgId>/shop/<shopId>'),
  patchShop(uri: '$baseUrlApiIrAppV1/org/<orgId>/shop/<shopId>'),
  shopEmps(uri: '$baseUrlApiIrAppV1/org/<orgId>/shop/<shopId>/emp'),
  addShopEmp(uri: '$baseUrlApiIrAppV1/org/<orgId>/shop/<shopId>/emp'),
  patchShopEmp(
      uri: '$baseUrlApiIrAppV1/org/<orgId>/shop/<shopId>/emp/<empId>'),
  deleteShopEmp(
      uri: '$baseUrlApiIrAppV1/org/<orgId>/shop/<shopId>/emp/<empId>'),
  //DEV
  doNotUse(uri: '');

  const IrApiUri({
    required this.uri,
  });

  final String uri;
}
