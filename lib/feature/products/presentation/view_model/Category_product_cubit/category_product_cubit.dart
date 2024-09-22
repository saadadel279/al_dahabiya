import 'package:al_dahabiya/feature/products/data/models/category_product_model.dart';
import 'package:al_dahabiya/feature/products/data/repo/categories_product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  CategoryProductCubit(this.categoryProductRepo)
      : super(CategoryProductInitial());
  final CategoryProductRepo categoryProductRepo;

  Future<void> getCategoryProducts(int id) async {
    emit(CategoryProductLoading());
    final result = await categoryProductRepo.getCategoryProducts(id);
    result.fold(
        (error) => emit(CategoryProductFailure(errMessage: error)),
        (products) =>
            emit(CategoryProductSuccess(categoryProductModel: products)));
  }
}
