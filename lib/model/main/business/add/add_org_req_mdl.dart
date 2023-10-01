import 'package:idukaan/model/main/business/add/org_types_mdl.dart';

class AddOrgReqMdl {
  OrgTypesMdl? _type;
  String _name = '';
  String _regNo = '';
  String _doc = '';

  void setType(OrgTypesMdl type) => _type = type;
  void setName(String name) => _name = name;
  void setRegNo(String registration) => _regNo = registration;
  void setDoc(String document) => _doc = document;

  OrgTypesMdl get getType => _type!;
  String get getName => _name;
  String get getRegNo => _regNo;
  String get getDoc => _doc;

  void setInitValues() {
    _name = '';
    _regNo = '';
    _doc = '';
  }
}
