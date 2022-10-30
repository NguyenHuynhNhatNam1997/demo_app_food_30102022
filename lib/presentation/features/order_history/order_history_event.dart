import 'package:demo_app_food_30102022/common/bases/base_event.dart';

abstract class OrderHistoryEvent extends BaseEvent {}

class FetchOrderHistoryEvent extends OrderHistoryEvent {
  @override
  List<Object?> get props => [];
}
