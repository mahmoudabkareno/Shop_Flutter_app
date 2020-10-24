import 'dart:html';

import 'package:shop/oder/order.dart';
import 'package:shop/oder/orderController.dart';
import 'package:shop/product/BaseProduct.dart';
import 'package:shop/product/ProductController.dart';
import 'package:shop/user/Address.dart';
import 'package:shop/user/user.dart';

class Customer extends User {
  Address shippingAddress;
  Address billingAddress;

  List<BaseProduct> wachlist;
  List<BaseOrder> orders;

  Customer(
      String id,
      String firstName,
      String lastName,
      String email,
      String phone,
      String gender,
      Address shippingAddress,
      Address billingAddress,
      List<BaseProduct> wachlist,
      List<BaseOrder> orders)
      : super(id, firstName, lastName, email, phone, gender) {
    this.shippingAddress = shippingAddress;
    this.billingAddress = billingAddress;
    this.wachlist = wachlist;
    this.orders = orders;
  }
  Customer.fromJson(Map<String , dynamic> jsonObject)
      : super(jsonObject['id'], jsonObject['first_name'],
      jsonObject['last_name'], jsonObject['email'], jsonObject['phone'],jsonObject ['gender']){
    this.shippingAddress = Address.fromJson(jsonObject['shippingaddress']);
    this.billingAddress = Address.fromJson(jsonObject['billingaddress']);
    this.wachlist = ProductController.toProduct(jsonObject['wachList']);
    this.orders = OrderController.toOrder(jsonObject['order']);
  }
}
