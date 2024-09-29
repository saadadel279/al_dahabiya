import 'package:al_dahabiya/feature/home/data/models/most_ptoduct_model.dart';
import 'package:al_dahabiya/feature/home/data/repo/most_visited_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'most_visited_state.dart';

class MostVisitedCubit extends Cubit<MostVisitedState> {
  MostVisitedCubit(this.mostVisitedRepo) : super(MostVisitedInitial());
  final MostVisitedRepo mostVisitedRepo;

  Future<void> getMostVisited() async {
    emit(MostVisitedLoading());
    final result = await mostVisitedRepo.getMostVisited();
    result.fold(
      (error) => emit(MostVisitedFailure(errorMessage: error)),
      (mostvisited) => emit(MostVisitedSuccess(mostVisitedModel: mostvisited)),
    );
  }
}
