import 'package:demo_app_food_30102022/common/bases/base_event.dart';

abstract class HomeEvent extends BaseEvent {}

class FetchProductsEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class FetchCartEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class AddCartEvent extends HomeEvent {
  String idProduct;

  AddCartEvent({required this.idProduct});

  @override
  List<Object?> get props => [idProduct];
}
