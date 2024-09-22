import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/products/data/models/category_product_model.dart';
import 'package:dartz/dartz.dart';

class CategoryProductRepo {
  final ApiServices apiServices;
  CategoryProductModel? categotyProductsModel;

  CategoryProductRepo({required this.apiServices});
  Future<Either<String, CategoryProductModel?>> getCategoryProducts(
      int id) async {
    try {
      var response =
          await apiServices.get('${EndPoint.getCategoryProducts}/$id');
      if (response['code'] == 200) {
        categotyProductsModel = CategoryProductModel.fromJson(response);
        return right(categotyProductsModel);
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
