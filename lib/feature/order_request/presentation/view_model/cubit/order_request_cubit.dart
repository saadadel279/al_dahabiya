import 'package:al_dahabiya/feature/order_request/data/models/order_response_model.dart';
import 'package:al_dahabiya/feature/order_request/data/repo/order_request.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_request_state.dart';

class OrderRequestCubit extends Cubit<OrderRequestState> {
  OrderRequestCubit(this.orderRequestRepo) : super(OrderRequestInitial());
  final OrderRequestRepo orderRequestRepo;

  Future<void> orderRequest() async {
    emit(OrderRequestLoading());
    final response = await orderRequestRepo.orderRequest();
    response.fold(
      (error) => emit(OrderRequestFailure(errorMessage: error)),
      (order) => emit(OrderRequestSuccess(orderResponseModel: order)),
    );
  }
}
