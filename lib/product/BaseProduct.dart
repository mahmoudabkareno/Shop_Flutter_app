import 'package:shop/Discount/baseDiscount.dart';
import 'package:shop/Discount/discountController.dart';
import 'package:shop/Image/baseimage.dart';
import 'package:shop/Image/imageController.dart';
import 'package:shop/catogory/baseCatogry.dart';
import 'package:shop/catogory/catogryController.dart';
import 'package:shop/productOption/baseProductOption.dart';
import 'package:shop/productOption/productOptionController.dart';
import 'package:shop/tag/baseTag.dart';
import 'package:shop/tag/tagController.dart';

class BaseProduct {
  String id, title, description;
  double price, quantity;
  List<BaseImage> image;
  List<BaseProductOption> productOption;
  List<BaseCatogry> catogry;
  List<BaseTag> tag;
  List<BaseDiscount> discount;

  BaseProduct(this.id, this.title, this.description, this.price, this.quantity,
      this.image, this.productOption, this.catogry, this.tag, this.discount);

  BaseProduct.fromJson(Map<String , dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.price = jsonObject['price'];
    this.quantity = jsonObject['quantity'];
    this.image = ImageController.toImage(jsonObject['image']);
    this.productOption = ProductOptionController.toProductOption(jsonObject['productOption']);
    this.catogry = CatogryController.toCatogry(jsonObject['catogry']);
    this.tag = TagController.toTag(jsonObject['tag']);
    this.discount = DiscountController.toDiscount(jsonObject['discount']);
  }
}
