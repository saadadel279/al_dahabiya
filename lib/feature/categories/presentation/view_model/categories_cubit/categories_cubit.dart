import 'package:al_dahabiya/feature/categories/data/models/categories_model.dart';
import 'package:al_dahabiya/feature/categories/data/repo/categores_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoresRepo) : super(CategoriesInitial());

  final CategoresRepo categoresRepo;

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var categories = await categoresRepo.getCategories();
    categories.fold((error) => emit(CategoriesFailuer(errMessage: error)),
        (categories) => emit(CategoriesSucsses(categoriesModel: categories)));
  }
}
