import 'package:demo_app_food_30102022/common/bases/base_event.dart';

abstract class CartEvent extends BaseEvent {}

class FetchCartEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCartEvent extends BaseEvent {
  String idCart;
  String idProduct;
  int quantity;

  UpdateCartEvent(
      {required this.idCart, required this.idProduct, required this.quantity});

  @override
  List<Object?> get props => [];
}

class CartConform extends BaseEvent {
  String idCart;

  CartConform({required this.idCart});

  @override
  List<Object?> get props => [];
}
