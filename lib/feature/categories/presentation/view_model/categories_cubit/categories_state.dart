part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSucsses extends CategoriesState {
  final CategoriesModel? categoriesModel;

  CategoriesSucsses({required this.categoriesModel});
}

final class CategoriesFailuer extends CategoriesState {
  final String errMessage;

  CategoriesFailuer({required this.errMessage});
}
