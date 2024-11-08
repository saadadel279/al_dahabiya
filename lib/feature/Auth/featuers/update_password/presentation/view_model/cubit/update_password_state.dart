part of 'update_password_cubit.dart';

@immutable
sealed class UpdatePasswordState {}

final class UpdatePasswordInitial extends UpdatePasswordState {}

final class UpdatePasswordLoading extends UpdatePasswordState {}

final class UpdatePasswordSuccess extends UpdatePasswordState {
  final UpdatePasswordModel updatePasswordModel;
  UpdatePasswordSuccess({required this.updatePasswordModel});
}

final class UpdatePasswordFaileur extends UpdatePasswordState {
  final String errMessage;
  UpdatePasswordFaileur({required this.errMessage});
}
