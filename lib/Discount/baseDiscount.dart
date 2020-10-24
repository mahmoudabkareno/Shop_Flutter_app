class BaseDiscount {
  double minQuantity, maxQuantity, amoount;
  DateTime endDate;

  BaseDiscount(this.minQuantity, this.maxQuantity, this.amoount, this.endDate);

  BaseDiscount.fromJson(Map<String , dynamic> jsonObject){
    this.minQuantity = jsonObject['minQuantity'];
    this.maxQuantity = jsonObject['maxQuantity'];
    this.amoount = jsonObject['amount'];
    this.endDate = DateTime.parse(jsonObject['endDate']);
  }

}
