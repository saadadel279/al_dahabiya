part of 'slider_cubit.dart';

@immutable
sealed class SliderState {}

final class SliderInitial extends SliderState {}

final class SliderLoading extends SliderState {}

final class SliderSuccess extends SliderState {
  final SliderModel? sliderModel;

  SliderSuccess({required this.sliderModel});
}

final class SliderFailure extends SliderState {
  final String errorMessage;

  SliderFailure({required this.errorMessage});
}
