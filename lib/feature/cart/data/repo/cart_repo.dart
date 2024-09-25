import 'package:al_dahabiya/core/database/sql_db.dart';
import 'package:dartz/dartz.dart';

import '../models/cart_item_model.dart';

class CartRepo {
  final SqlDB sqlDB;

  CartRepo({required this.sqlDB});

  Future<Either<String, List<CartItemModel>>> getCartItem() async {
    try {
      var response = await sqlDB.selectData('''SELECT * FROM cart''');

      if (response.isNotEmpty) {
        List<CartItemModel> cartItems = response.map<CartItemModel>((item) {
          return CartItemModel.fromJson(item);
        }).toList();

        return right(cartItems);
      } else {
        return left("Cart is empty");
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, int?>> deleteCartItem(int id) async {
    try {
      var response =
          await sqlDB.deleteData('''DELETE FROM cart WHERE id = $id''');
      return right(response);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, int?>> insertCartItem(int productId, String sql) async {
    try {
      var existingItem = await sqlDB
          .selectData('SELECT * FROM cart WHERE product_id = $productId');

      if (existingItem.isNotEmpty) {
        return left("Product is already in the cart.");
      } else {
        var response = await sqlDB.insertData(sql);
        return right(response);
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, int?>> clearTable() async {
    try {
      var response = await sqlDB.clearTable();
      return right(response);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, double>> calculateTotalPrice() async {
    try {
      var response =
          await sqlDB.selectData('''SELECT price, quantity FROM cart''');

      if (response.isNotEmpty) {
        double totalPrice = 0.0;

        for (var item in response) {
          double price = item['price'] as double;
          int quantity = item['quantity'] as int;
          totalPrice += price * quantity;
        }

        return right(totalPrice);
      } else {
        return left("Cart is empty");
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
