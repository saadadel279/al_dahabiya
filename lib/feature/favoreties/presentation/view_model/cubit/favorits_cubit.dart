import 'package:al_dahabiya/feature/favoreties/data/models/favorite_iteam_model.dart';
import 'package:al_dahabiya/feature/favoreties/data/repo/favorits_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorits_state.dart';

class FavoritsCubit extends Cubit<FavoritsState> {
  FavoritsCubit(this.favoritsRepo) : super(FavoritsInitial());
  final FavoritsRepo favoritsRepo;

  Future<void> getFavorits() async {
    emit(FavoritsLoading());
    final response = await favoritsRepo.getFavorits();
    response.fold(
      (error) => emit(FavoritsFailure(errorMessage: error)),
      (result) => emit(FavoritsSuccess(products: result)),
    );
  }
}
