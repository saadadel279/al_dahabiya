import 'package:al_dahabiya/feature/categories/data/repo/categories_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/categoty_Response_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());
  final CategoriesRepo categoriesRepo;

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final response = await categoriesRepo.getCategories();
    response.fold(
      (error) => emit(CategoriesFailure(errorMessage: error)),
      (categories) =>
          emit(CategoriesSuccess(categoryResponseModel: categories)),
    );
  }
}
