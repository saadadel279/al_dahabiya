import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/products/data/models/brand_product_model.dart';
import 'package:dartz/dartz.dart';

class BrandProductRepo {
  final ApiServices apiServices;
  BrandProductsModel? brandProductsModel;

  BrandProductRepo({required this.apiServices});
  Future<Either<String, BrandProductsModel?>> getBrandProducts(int id) async {
    try {
      var response = await apiServices.get('${EndPoint.getBrandsProduct}/$id');
      if (response['code'] == 200) {
        brandProductsModel = BrandProductsModel.fromJson(response);
        return right(brandProductsModel);
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
