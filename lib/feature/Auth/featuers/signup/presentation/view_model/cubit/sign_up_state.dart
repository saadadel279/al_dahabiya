part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpSucsess extends SignUpState {
  final SignUpModel? signUpModel;
  SignUpSucsess({required this.signUpModel});
}

final class SignUpFaileur extends SignUpState {
  final String errMessage;
  SignUpFaileur({required this.errMessage});
}

final class SignUpLoading extends SignUpState {}
