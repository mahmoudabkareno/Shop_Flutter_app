class BasePayment{
  double amount;
  String paymentId, paymentMethod;
  DateTime paymentDate;

  BasePayment(this.paymentId, this.amount, this.paymentDate, this.paymentMethod);

  BasePayment.fromJson(Map<String, dynamic> jsonObject){
    this.paymentId = jsonObject['paymentId'];
    this.amount = jsonObject['amount'];
    this.paymentDate = DateTime.parse(jsonObject['paymentDate']);
    this.paymentMethod = jsonObject['paymentMathod'];
  }

}