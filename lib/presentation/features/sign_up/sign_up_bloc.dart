import 'dart:async';

import 'package:demo_app_food_30102022/common/bases/base_bloc.dart';
import 'package:demo_app_food_30102022/common/bases/base_event.dart';
import 'package:demo_app_food_30102022/data/datasources/models/user_model.dart';
import 'package:demo_app_food_30102022/data/repositories/authentication_repository.dart';
import 'package:demo_app_food_30102022/presentation/features/sign_up/sign_up_event.dart';

class SignUpBloc extends BaseBloc {
  StreamController<UserModel> userController = StreamController();
  StreamController<String> message = StreamController();
  late AuthenticationRepository _authenticationRepository;

  void setAuthenticationRepository(
      {required AuthenticationRepository authenticationRepository}) {
    _authenticationRepository = authenticationRepository;
  }

  @override
  void dispatch(BaseEvent event) {
    if (event is SignUpExecuteEvent) {
      _executeSignUp(event);
    }
  }

  @override
  void dispose() {
    super.dispose();
    userController.close();
    message.close();
  }

  void _executeSignUp(SignUpExecuteEvent event) {
    loadingSink.add(true);
    _authenticationRepository
        .register(
            email: event.email,
            password: event.password,
            name: event.name,
            address: event.address,
            phone: event.phone)
        .then((userResponse) {
      userController.sink.add(UserModel(
          email: userResponse.email ?? "",
          name: userResponse.name ?? "",
          phone: userResponse.phone ?? "",
          token: userResponse.token ?? ""));
      loadingSink.add(false);
      progressSink.add(SignUpSuccessEvent());
    }).catchError((error) {
      message.sink.add(error);
      loadingSink.add(false);
    });
  }
}
