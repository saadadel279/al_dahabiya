part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class AddOrDeleatToCartSuccess extends CartState {
  final int? id;

  AddOrDeleatToCartSuccess({required this.id});
}

class CartSuccess extends CartState {
  final List<CartItemModel> cartItems;
  CartSuccess({required this.cartItems});
}

final class CartFailure extends CartState {
  final String errorMessage;

  CartFailure({required this.errorMessage});
}

final class ClearTableSuccess extends CartState {
  final int? statee;

  ClearTableSuccess({required this.statee});
}
