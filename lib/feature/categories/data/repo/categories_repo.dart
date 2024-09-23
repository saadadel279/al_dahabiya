import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/categories/data/model/categoty_Response_model.dart';
import 'package:dartz/dartz.dart';

class CategoriesRepo {
  final ApiServices apiServices;

  CategoryResponseModel? categoryResponseModel;

  CategoriesRepo({required this.apiServices});

  Future<Either<String, CategoryResponseModel?>> getCategories() async {
    try {
      var response = await apiServices.get(EndPoint.getCategories);
      categoryResponseModel = CategoryResponseModel.fromJson(response);
      return right(categoryResponseModel!);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('something went wrong');
    }
  }
}
