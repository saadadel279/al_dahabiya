part of 'brand_products_cubit.dart';

@immutable
sealed class BrandProductsState {}

final class BrandProductsInitial extends BrandProductsState {}

final class BrandProductsLoading extends BrandProductsState {}

final class BrandProductsSuccess extends BrandProductsState {
  final BrandProductsModel? brandProductModel;

  BrandProductsSuccess({
    required this.brandProductModel,
  });
}

final class BrandProductsFailure extends BrandProductsState {
  final String errMessage;

  BrandProductsFailure({required this.errMessage});
}
