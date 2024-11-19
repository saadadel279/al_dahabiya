part of 'filter_product_cubit.dart';

@immutable
sealed class FilterProductState {}

final class FilterProductInitial extends FilterProductState {}

final class FilterProductLoading extends FilterProductState {}

final class FilterProductSuccess extends FilterProductState {
  final FilteredProductModel filteredPoductModel;
  FilterProductSuccess(this.filteredPoductModel);
}

final class FilterProductFailure extends FilterProductState {
  final String errMessage;
  FilterProductFailure(this.errMessage);
}

final class BrandsLoading extends FilterProductState {}

final class BrandsSuccess extends FilterProductState {
  final List<BrandsModel> brandssModel;
  BrandsSuccess({required this.brandssModel});
}

final class BrandsFailure extends FilterProductState {
  final String errMessage;
  BrandsFailure({required this.errMessage});
}

final class CategoriesLoading extends FilterProductState {}

final class CategoriesSuccess extends FilterProductState {
  final List<CategoryResponseModel> categoryResponseModel;
  CategoriesSuccess({required this.categoryResponseModel});
}

final class CategoriesFailure extends FilterProductState {
  final String errorMessage;
  CategoriesFailure({required this.errorMessage});
}
