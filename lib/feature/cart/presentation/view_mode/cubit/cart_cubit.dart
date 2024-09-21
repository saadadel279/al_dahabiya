import 'package:bloc/bloc.dart';

import '../../../data/models/cart_item_model.dart';

class CartCubit extends Cubit<List<CartItemModel>> {
  CartCubit() : super([]);

  void loadInitialItems() {
    emit([
      CartItemModel(
          name: "مكـنسـة",
          imageUrl: "assets/images/product.jpeg",
          price: 25,
          quantity: 2),
      CartItemModel(
          name: "فـوطـة",
          imageUrl: "assets/images/product.jpeg",
          price: 20,
          quantity: 1),
      CartItemModel(
          name: "مـنـاديل",
          imageUrl: "assets/images/product.jpeg",
          price: 15,
          quantity: 2),
      CartItemModel(
          name: "مـطـهر",
          imageUrl: "assets/images/product.jpeg",
          price: 10,
          quantity: 2),
    ]);
  }

  void incrementQuantity(int index) {
    List<CartItemModel> updatedCart = [];
    for (var item in state) {
      updatedCart.add(CartItemModel(
        name: item.name,
        imageUrl: item.imageUrl,
        price: item.price,
        quantity: item.quantity,
      ));
    }
    updatedCart[index].quantity++;
    emit(updatedCart);
  }

  void decrementQuantity(int index) {
    List<CartItemModel> updatedCart = [];
    for (var item in state) {
      updatedCart.add(CartItemModel(
        name: item.name,
        imageUrl: item.imageUrl,
        price: item.price,
        quantity: item.quantity,
      ));
    }
    if (updatedCart[index].quantity > 1) {
      updatedCart[index].quantity--;
    }
    emit(updatedCart);
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in state) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
