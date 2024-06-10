// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final PostApiStatus postApiStatus;
  final String error;
  const LoginState(
      {this.email = '',
      this.password = '',
      this.postApiStatus = PostApiStatus.initial,
      this.error =''});

  LoginState copyWith({
    String? email,
    String? password,
    PostApiStatus? postApiStatus,
    String? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [email, password, postApiStatus, error];
}
