import 'package:al_dahabiya/feature/products/data/repo/brand_product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/brand_product_model.dart';

part 'brand_products_state.dart';

class BrandProductsCubit extends Cubit<BrandProductsState> {
  BrandProductsCubit(this.brandProductRepo) : super(BrandProductsInitial());

  final BrandProductRepo brandProductRepo;
  Future<void> grtBrandProducts(int id) async {
    emit(BrandProductsLoading());
    final result = await brandProductRepo.getBrandProducts(id);
    result.fold((error) => emit(BrandProductsFailure(errMessage: error)),
        (products) => emit(BrandProductsSuccess(brandProductModel: products)));
  }
}
