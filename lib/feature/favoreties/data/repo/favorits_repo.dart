import 'dart:developer';

import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/favoreties/data/models/favorite_iteam_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/database/sql_db.dart';

class FavoritsRepo {
  final SqlDB sqlDB;

  FavoritsRepo({required this.sqlDB});

  Future<Either<String, List<FavoritItemModel>>> getFavorits() async {
    try {
      var response = await sqlDB.selectData('''SELECT * FROM favorites''');
      log(response.toString());
      if (response.isNotEmpty) {
        List<FavoritItemModel> favoritesItems =
            response.map<FavoritItemModel>((item) {
          return FavoritItemModel.fromJson(item);
        }).toList();
        return right(favoritesItems);
      } else {
        return left("favorites is empty");
      }
    } on ServerException catch (e) {
      return left(e.toString());
    }
  }
}
