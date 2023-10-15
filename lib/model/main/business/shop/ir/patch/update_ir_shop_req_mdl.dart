class UpdateIrShopReqMdl {
  String orgId = '';
  String id = '';
  String _contactNo = '';
  bool _isCash = false;
  bool _isUpi = false;
  bool _isCard = false;

  void setContactNo(String contactNo) => _contactNo = contactNo;
  void setIsCash(bool isCash) => _isCash = isCash;
  void setIsUpi(bool isUpi) => _isUpi = isUpi;
  void setIsCard(bool isCard) => _isCard = isCard;

  String get getContactNo => _contactNo;
  bool get getIsCash => _isCash;
  bool get getIsUpi => _isUpi;
  bool get getIsCard => _isCard;
}
