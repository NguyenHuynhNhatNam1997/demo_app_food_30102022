import 'package:demo_app_food_30102022/common/bases/base_event.dart';

abstract class SignInEvent extends BaseEvent {}

class LoginEvent extends SignInEvent {
  late String email, password;

  LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [];
}

class LoginSuccessEvent extends SignInEvent {
  LoginSuccessEvent();

  @override
  List<Object?> get props => [];
}
