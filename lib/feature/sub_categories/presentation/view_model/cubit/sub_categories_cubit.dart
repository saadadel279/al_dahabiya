import 'package:al_dahabiya/feature/sub_categories/data/model/sub_categories_model.dart';
import 'package:al_dahabiya/feature/sub_categories/data/repo/sub_categories_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sub_categories_state.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit(this.subCategoriesRepo) : super(SubCategoriesInitial());
  final SubCategoriesRepo subCategoriesRepo;

  Future<void> getSubCategories(int categoryId) async {
    emit(SubCategoriesLoading());
    final response = await subCategoriesRepo.getSubCategories(categoryId);
    response.fold(
        (error) => emit(SubCategoriesFailure(errorMessage: error)),
        (subCategories) =>
            emit(SubCategoriesSuccess(subCategoriesModel: subCategories)));
  }
}
