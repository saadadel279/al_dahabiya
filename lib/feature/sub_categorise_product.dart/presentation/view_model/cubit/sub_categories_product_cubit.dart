import 'package:al_dahabiya/feature/sub_categorise_product.dart/data/models/sub_categories_product_model.dart';
import 'package:al_dahabiya/feature/sub_categorise_product.dart/data/repo/sub_categorise_product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sub_categories_product_state.dart';

class SubCategoriesProductCubit extends Cubit<SubCategoriesProductState> {
  SubCategoriesProductCubit(this.subCategoriesProductRepo)
      : super(SubCategoriesProductInitial());
  final SubCategoriseProductRepo subCategoriesProductRepo;

  Future<void> getSubCategoriseProduct(int id) async {
    emit(SubCategoriesProductLoading());
    final response = await subCategoriesProductRepo.getSubCategoriseProduct(id);
    response.fold(
      (error) => emit(SubCategoriesProductFailure(errorMessage: error)),
      (subCategoriesProduct) => emit(SubCategoriesProductSuccess(
          subCategoriesProductModel: subCategoriesProduct)),
    );
  }
}
