import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterbloc_cleanarchitecture/repository/auth/login_repository.dart';
import 'package:flutterbloc_cleanarchitecture/services/session_manager/session_controller.dart';
import 'package:flutterbloc_cleanarchitecture/utils/enums.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = LoginRepository();
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<LoginButtonEvent>(_loginApi);
  }

  void _emailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _loginApi(LoginEvent event, Emitter<LoginState> emit) async {
    // "email": "eve.holt@reqres.in",
    // "password": "cityslicka"
    Map data = {"email": state.email, "password": state.password};
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    await loginRepository.loginApi(data).then((value) async {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(
            error: value.error.toString(), postApiStatus: PostApiStatus.error));
      } else {
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();

        emit(state.copyWith(
            error: value.token, postApiStatus: PostApiStatus.success));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          error: error.toString(), postApiStatus: PostApiStatus.error));
    });
  }
}
