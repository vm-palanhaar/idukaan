const String baseUrlApi = 'http://192.168.29.176:8080/api';

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
  orgEmp(uri: '$baseUrlApiBusAppV1/org/<orgId>/emp'),
  deleteOrgEmp(uri: '$baseUrlApiBusAppV1/org/<orgId>/emp/<orgEmpId>'),
  patchOrgEmp(uri: '$baseUrlApiBusAppV1/org/<orgId>/emp/<orgEmpId>'),
  addOrgGst(uri: '$baseUrlApiBusAppV1/org/<orgId>/gst'),
  orgGstList(uri: '$baseUrlApiBusAppV1/org/<orgId>/gst'),
  //DEV
  doNotUse(uri: '');

  const BusinessApiUri({
    required this.uri,
  });

  final String uri;
}
