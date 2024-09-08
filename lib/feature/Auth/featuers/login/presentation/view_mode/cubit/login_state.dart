part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSucsess extends LoginState {
  final LoginModel? loginModel;

  LoginSucsess({required this.loginModel});
}

final class LoginFaileur extends LoginState {
  final String errMessage;

  LoginFaileur({required this.errMessage});
}

final class LoginLoading extends LoginState {}
