part of 'sub_categories_cubit.dart';

@immutable
sealed class SubCategoriesState {}

final class SubCategoriesInitial extends SubCategoriesState {}

final class SubCategoriesLoading extends SubCategoriesState {}

final class SubCategoriesSuccess extends SubCategoriesState {
  final SubCategoriesModel? subCategoriesModel;
  SubCategoriesSuccess({required this.subCategoriesModel});
}

final class SubCategoriesFailure extends SubCategoriesState {
  final String errorMessage;
  SubCategoriesFailure({required this.errorMessage});
}
