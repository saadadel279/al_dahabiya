import 'package:al_dahabiya/feature/my_orders/data/model/my_orders_model,dart';
import 'package:al_dahabiya/feature/my_orders/data/repo/my_orders_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(this.myOrdersRepo) : super(MyOrdersInitial());
  final MyOrdersRepo myOrdersRepo;

  Future<void> getMyOrders() async {
    emit(MyOrdersLoading());
    var result = await myOrdersRepo.getmyOrders();
    result.fold((failure) => emit(MyOrdersFailure(errMessage: failure)),
        (myOrders) => emit(MyOrderSuccess(myOrdersModel: myOrders)));
  }

  Future<void> cancelOrder(int orderId) async {
    emit(CancelOrderLoading());
    var result = await myOrdersRepo.cancelOrder(orderId);
    result.fold((failure) => emit(CancelOrderFailure(errMessage: failure)),
        (myOrders) => emit(CancelOrderSuccses(message: myOrders)));
  }
}
