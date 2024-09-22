import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../models/categories_model.dart';

class CategoresRepo {
  final ApiServices apiServices;
  CategoriesModel? categoriesModel;

  CategoresRepo({required this.apiServices});
  Future<Either<String, CategoriesModel?>> getCategories() async {
    try {
      var response = await apiServices.get(EndPoint.getCategories);
      if (response['code'] == 200) {
        categoriesModel = CategoriesModel.fromJson(response);
        return right(categoriesModel);
      } else {
        return left(response['message']);
      }
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
