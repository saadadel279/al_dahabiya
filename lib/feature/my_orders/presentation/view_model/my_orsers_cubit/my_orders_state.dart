part of 'my_orders_cubit.dart';

@immutable
sealed class MyOrdersState {}

final class MyOrdersInitial extends MyOrdersState {}

final class MyOrdersLoading extends MyOrdersState {}

final class MyOrderSuccess extends MyOrdersState {
  final MyOrdersModel myOrdersModel;
  MyOrderSuccess({required this.myOrdersModel});
}

final class MyOrdersFailure extends MyOrdersState {
  final String errMessage;
  MyOrdersFailure({required this.errMessage});
}

final class CancelOrderLoading extends MyOrdersState {}

final class CancelOrderSuccses extends MyOrdersState {
  final String message;
  CancelOrderSuccses({required this.message});
}

final class CancelOrderFailure extends MyOrdersState {
  final String errMessage;
  CancelOrderFailure({required this.errMessage});
}
