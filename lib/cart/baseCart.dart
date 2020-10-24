import 'package:shop/cart/baseCartItem.dart';
import 'package:shop/cart/cartItmeController.dart';

class BaseCart{
  List<BaseCartItem> item;

  BaseCart(this.item);

  BaseCart.fromJson(Map<String , dynamic> jsonObject){
    this.item = CartItemController.toCartItem(jsonObject['item']);

  }

}