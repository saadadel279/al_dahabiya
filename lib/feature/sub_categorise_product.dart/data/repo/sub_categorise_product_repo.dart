import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/sub_categorise_product.dart/data/models/sub_categories_product_model.dart';
import 'package:dartz/dartz.dart';

class SubCategoriseProductRepo {
  final ApiServices apiServices;
  SubCategoriseProductRepo({required this.apiServices});

  Future<Either<String, SubCategoriesProductModel?>> getSubCategoriseProduct(
      int id) async {
    try {
      var response =
          await apiServices.get('${EndPoint.getSubCategoriesProduct}/$id');
      if (response['code'] == 200) {
        return right(SubCategoriesProductModel.fromJson(response));
      } else {
        return left(response['message']);
      }
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('something went wrong');
    }
  }
}
