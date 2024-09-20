import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/home/data/models/brands_model.dart';
import 'package:dartz/dartz.dart';

class BrandsRepo {
  final ApiServices apiServices;
  BrandsModel? brandsModel;

  BrandsRepo({required this.apiServices});
  Future<Either<String, BrandsModel>> getCategories() async {
    try {
      var response = await apiServices.get(EndPoint.getBrands);
      if (response['code'] == 200) {
        brandsModel = BrandsModel.fromJson(response);
        return right(brandsModel!);
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
