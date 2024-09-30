import 'package:al_dahabiya/feature/home/data/models/slider_model.dart';
import 'package:al_dahabiya/feature/home/data/repo/slider_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit(this.sliderRepo) : super(SliderInitial());
  final SliderRepo sliderRepo;
  Future<void> getSlider() async {
    emit(SliderLoading());
    final response = await sliderRepo.getSlider();
    response.fold(
      (error) => emit(SliderFailure(errorMessage: error)),
      (slider) => emit(SliderSuccess(sliderModel: slider)),
    );
  }
}
