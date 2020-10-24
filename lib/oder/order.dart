import 'package:shop/cart/baseCart.dart';
import 'package:shop/payment/basePayment.dart';
import 'package:shop/user/customer.dart';

class BaseOrder{
  BaseCart cart;
  Customer customer;
  BasePayment payment;

  BaseOrder(this.cart , this.customer , this.payment);

  BaseOrder.fromJson(Map<String , dynamic> jsonObject){
    this.cart = BaseCart.fromJson(jsonObject['cart']);
    this.customer = Customer.fromJson(jsonObject['customer']);
    this.payment = BasePayment.fromJson(jsonObject['payment']);
  }

  double total(){

  }
}