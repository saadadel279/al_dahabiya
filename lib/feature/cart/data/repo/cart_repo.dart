import 'package:al_dahabiya/core/database/sql_db.dart';
import 'package:dartz/dartz.dart';

import '../models/cart_item_model.dart';

class CartRepo {
  final SqlDB sqlDB;

  CartRepo({required this.sqlDB});

  Future<Either<String, CartItemModel?>> getCartItem() async {
    try {
      var response = await sqlDB.selectData('''SELECT * FROM cart''');
      return right(CartItemModel.fromJson(response));
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, CartItemModel?>> deleteCartItem(int id) async {
    try {
      var response =
          await sqlDB.deleteData('''DELETE FROM cart WHERE id = $id''');
      return right(CartItemModel.fromJson(response));
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, CartItemModel?>> insertCartItem(
      int productId, String sql) async {
    try {
      var existingItem = await sqlDB
          .selectData('''SELECT * FROM cart WHERE product_id = $productId''');

      if (existingItem.isNotEmpty) {
        return left("Product is already in the cart.");
      } else {
        var response = await sqlDB.insertData(sql);
        return right(CartItemModel.fromJson(response));
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
