part of 'sub_categories_product_cubit.dart';

@immutable
sealed class SubCategoriesProductState {}

final class SubCategoriesProductInitial extends SubCategoriesProductState {}

final class SubCategoriesProductLoading extends SubCategoriesProductState {}

final class SubCategoriesProductSuccess extends SubCategoriesProductState {
  final SubCategoriesProductModel? subCategoriesProductModel;
  SubCategoriesProductSuccess({
    required this.subCategoriesProductModel,
  });
}

final class SubCategoriesProductFailure extends SubCategoriesProductState {
  final String errorMessage;
  SubCategoriesProductFailure({
    required this.errorMessage,
  });
}
