import 'package:al_dahabiya/feature/home/data/models/brands_model.dart';
import 'package:al_dahabiya/feature/home/data/repo/brand_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit(this.brandsRepo) : super(BrandsInitial());

  final BrandsRepo brandsRepo;

  Future<void> getBrands() async {
    emit(BrandsLoading());
    var response = await brandsRepo.getBrands();
    response.fold((error) => emit(BrandsFailure(errMessage: error)),
        (categories) => emit(BrandsSuccess(categoriesModel: categories)));
  }
}
