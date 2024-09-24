import 'package:al_dahabiya/feature/cart/data/models/cart_item_model.dart';
import 'package:al_dahabiya/feature/cart/data/repo/cart_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;

  Future<void> getCartItem() async {
    emit(CartLoading());
    final response = await cartRepo.getCartItem();
    response.fold(
      (error) => emit(CartFailure(errorMessage: error)),
      (cartItem) => emit(CartSuccess(cartItems: cartItem)),
    );
  }

  Future<void> deleteCartItem(int id) async {
    emit(CartLoading());
    final response = await cartRepo.deleteCartItem(id);
    response.fold(
      (error) => emit(CartFailure(errorMessage: error)),
      (cartItem) => emit(CartSuccess(cartItems: cartItem)),
    );
  }

  Future<void> insertCartItem(int productId, String sql) async {
    emit(CartLoading());
    final response = await cartRepo.insertCartItem(productId, sql);
    response.fold(
      (error) => emit(CartFailure(errorMessage: error)),
      (cartItem) => emit(CartSuccess(cartItems: cartItem)),
    );
  }
}
