part of 'order_request_cubit.dart';

@immutable
sealed class OrderRequestState {}

final class OrderRequestInitial extends OrderRequestState {}

final class OrderRequestLoading extends OrderRequestState {}

final class OrderRequestSuccess extends OrderRequestState {
  final OrderResponseModel? orderResponseModel;

  OrderRequestSuccess({required this.orderResponseModel});
}

final class OrderRequestFailure extends OrderRequestState {
  final String errorMessage;

  OrderRequestFailure({required this.errorMessage});
}
