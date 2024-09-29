part of 'most_visited_cubit.dart';

@immutable
sealed class MostVisitedState {}

final class MostVisitedInitial extends MostVisitedState {}

final class MostVisitedLoading extends MostVisitedState {}

final class MostVisitedSuccess extends MostVisitedState {
  final MostVisitedModel? mostVisitedModel;

  MostVisitedSuccess({required this.mostVisitedModel});
}

final class MostVisitedFailure extends MostVisitedState {
  final String errorMessage;

  MostVisitedFailure({required this.errorMessage});
}
