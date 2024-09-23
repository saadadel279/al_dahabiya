import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/sub_categories/data/model/sub_categories_model.dart';
import 'package:dartz/dartz.dart';

class SubCategoriesRepo {
  final ApiServices apiServices;
  SubCategoriesRepo({required this.apiServices});
  SubCategoriesModel? subCategoriesModel;

  Future<Either<String, SubCategoriesModel?>> getSubCategories(
      int categoryId) async {
    try {
      var response = await apiServices.get(EndPoint.getSubCategories);
      subCategoriesModel = SubCategoriesModel.fromJson(response);
      return right(subCategoriesModel!);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('something went wrong');
    }
  }
}
