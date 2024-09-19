import 'package:al_dahabiya/feature/home/data/models/categories_model.dart';
import 'package:al_dahabiya/feature/home/data/repo/categories_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());

  final CategoriesRepo categoriesRepo;

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var response = await categoriesRepo.getCategories();
    response.fold((error) => emit(CategoriesFailure(errMessage: error)),
        (categories) => emit(CategoriesSuccess(categoriesModel: categories)));
  }
}
