class AddIrShopReq1Mdl {
  String _name = '';
  String _shopNo = '';
  String _img = '';
  String _contactNo = '';

  void setName(String name) => _name = name;
  void setShopNo(String shopNo) => _shopNo = shopNo;
  void setImg(String img) => _img = img;
  void setContactNo(String contactNo) => _contactNo = contactNo;

  String get getName => _name;
  String get getShopNo => _shopNo;
  String get getImg => _img;
  String get getContactNo => _contactNo;

  void setInitValues() {
    _name = '';
    _shopNo = '';
    _img = '';
    _contactNo = '';
  }
}
