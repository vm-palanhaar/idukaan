class AddIrShopReq2Mdl {
  bool _isCash = false;
  bool _isUpi = false;
  bool _isCard = false;

  void setIsCash(bool isCash) => _isCash = isCash;
  void setIsUpi(bool isUpi) => _isUpi = isUpi;
  void setIsCard(bool isCard) => _isCard = isCard;

  bool get getIsCash => _isCash;
  bool get getIsUpi => _isUpi;
  bool get getIsCard => _isCard;

  void setInitValues() {
    _isCash = false;
    _isUpi = false;
    _isCard = false;
  }
}
