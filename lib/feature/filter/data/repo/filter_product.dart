import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/categories/data/model/categoty_Response_model.dart';
import 'package:al_dahabiya/feature/filter/data/models/filtered_poduct_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/api_services.dart';
import '../../../home/data/models/brands_model.dart';

class FilterProductRepo {
  final ApiServices apiServices;

  FilterProductRepo({required this.apiServices});

  Future<Either<String, FilteredProductModel?>> getFilterProduct(
    int? cat,
    List brands,
    List price,
  ) async {
    try {
      var response = await apiServices.post(EndPoint.getFilterProduct, body: {
        "cat": cat,
        "brands": brands,
        "price": price,
        "sort": "desc",
        "paginate": 1
      });
      if (response['code'] == 200) {
        return right(FilteredProductModel.fromJson(response));
      } else {
        return left(response['message']);
      }
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('something went wrong');
    }
  }

  CategoryResponseModel? categoryResponseModel;

  Future<Either<String, List<CategoryResponseModel>>> getCategories() async {
    try {
      var response = await apiServices.get(EndPoint.getCategories);
      categoryResponseModel = CategoryResponseModel.fromJson(response);
      return right([categoryResponseModel!]);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('something went wrong');
    }
  }

  BrandsModel? brandsModel;
  Future<Either<String, List<BrandsModel>>> getBrands() async {
    try {
      var response = await apiServices.get(EndPoint.getBrands);
      if (response['code'] == 200) {
        brandsModel = BrandsModel.fromJson(response);
        return right([brandsModel!]);
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
