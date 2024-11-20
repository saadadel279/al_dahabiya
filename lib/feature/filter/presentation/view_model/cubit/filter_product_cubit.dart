import 'package:al_dahabiya/feature/filter/data/repo/filter_product.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../categories/data/model/categoty_Response_model.dart';
import '../../../../home/data/models/brands_model.dart';
import '../../../data/models/filtered_poduct_model.dart';

part 'filter_product_state.dart';

class FilterProductCubit extends Cubit<FilterProductState> {
  FilterProductCubit(this.filterProductRepo) : super(FilterProductInitial());
  final FilterProductRepo filterProductRepo;

  Future<void> getFilterProduct(int? cat, List brands, List price) async {
    emit(FilterProductLoading());
    final result = await filterProductRepo.getFilterProduct(cat, brands, price);
    result.fold((error) => emit(FilterProductFailure(error)),
        (products) => emit(FilterProductSuccess(products!)));
  }

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final response = await filterProductRepo.getCategories();
    response.fold(
      (error) => emit(CategoriesFailure(errorMessage: error)),
      (categories) =>
          emit(CategoriesSuccess(categoryResponseModel: categories)),
    );
  }

  Future<void> getBrands() async {
    emit(BrandsLoading());
    var response = await filterProductRepo.getBrands();
    response.fold((error) => emit(BrandsFailure(errMessage: error)),
        (categories) => emit(BrandsSuccess(brandssModel: categories)));
  }
}
