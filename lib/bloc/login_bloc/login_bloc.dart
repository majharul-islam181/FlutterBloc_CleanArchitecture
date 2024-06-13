import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterbloc_cleanarchitecture/repository/auth/login_repository.dart';
import 'package:flutterbloc_cleanarchitecture/utils/enums.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = LoginRepository();
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<LoginEvent>(_loginApi);
    // on<EmailUnfocused>
  }

  void _emailChanged(EmailChanged event, Emitter<LoginState> emit) {
    if (kDebugMode) {
      print('Entered email: ${event.email}');
    }
    emit(state.copyWith(email: event.email));
  }

  void _passwordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginEvent event, Emitter<LoginState> emit) {
    // "email": "eve.holt@reqres.in",
    // "password": "cityslicka"
    Map data = {"email": state.email, "password": state.password};

    loginRepository.loginApi(data).then((value) {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(error: 'Login Successful'));
      } else {
         emit(state.copyWith(error: value.error.toString()));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(error: error.toString()));
    });
  }
}
