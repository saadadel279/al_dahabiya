import 'package:al_dahabiya/core/database/sql_db.dart';
import 'package:dartz/dartz.dart';

import '../models/cart_item_model.dart';

class CartRepo {
  final SqlDB sqlDB;

  CartRepo({required this.sqlDB});

  Future<Either<String, Tuple2<List<CartItemModel>, double>>>
      getCartItem() async {
    try {
      var response = await sqlDB.selectData('''SELECT * FROM cart''');

      if (response.isNotEmpty) {
        List<CartItemModel> cartItems = response.map<CartItemModel>((item) {
          return CartItemModel.fromJson(item);
        }).toList();

        // حساب السعر الإجمالي
        double totalPrice = 0.0;
        for (var item in response) {
          double price = item['price'] as double;
          int quantity = item['quantity'] as int;
          totalPrice += price * quantity;
        }

        // إرجاع العناصر والسعر الإجمالي كـ Tuple
        return right(Tuple2(cartItems, totalPrice));
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

  Future<Either<String, int?>> insertCartItem(
      int productId, String sql, int increment) async {
    try {
      // تحقق مما إذا كان العنصر موجودًا بالفعل في السلة
      var existingItem = await sqlDB
          .selectData('SELECT * FROM cart WHERE product_id = $productId');

      if (existingItem.isNotEmpty) {
        int currentQuantity = existingItem[0]['quantity'] as int;
        int newQuantity = currentQuantity + increment;

        await sqlDB.updateData(
            'UPDATE cart SET quantity = $newQuantity WHERE product_id = $productId');
        return right(newQuantity);
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
}
