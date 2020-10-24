import 'package:shop/oder/order.dart';
import 'package:shop/product/BaseProduct.dart';
import 'package:shop/user/customer.dart';

class CustomerController{
  Customer customer;

  CustomerController(this.customer);
  void addToOrder(BaseOrder order) {
    this.customer.orders.add(order);
  }

  void addToWachList(BaseProduct product) {
    this.customer.wachlist.add(product);
  }

  bool orderInOrders(BaseOrder order){
    return this.customer.orders.contains(order);
  }

  bool productInWachList(BaseProduct product){
    return this.customer.wachlist.contains(product);
  }

  bool removeProductFromWachList(BaseProduct product) {
    return this.customer.wachlist.remove(product);
  }

}