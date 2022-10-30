import 'package:demo_app_food_30102022/data/datasources/models/product_model.dart';

class CartModel {
  late String? id;
  late List<ProductModel>? products;
  late int? price;

  CartModel.initEmpty();

  CartModel(String? id, List<ProductModel>? products, int? price) {
    this.id = id ??= "";
    this.price = price ??= -1;
    this.products = products ??= [];
  }
}
