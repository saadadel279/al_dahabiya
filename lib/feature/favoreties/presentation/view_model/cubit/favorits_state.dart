part of 'favorits_cubit.dart';

@immutable
sealed class FavoritsState {}

final class FavoritsInitial extends FavoritsState {}

final class FavoritsSuccess extends FavoritsState {
  final List<FavoritItemModel> products;
  FavoritsSuccess({required this.products});
}

final class FavoritsFailure extends FavoritsState {
  final String errorMessage;
  FavoritsFailure({required this.errorMessage});
}

final class FavoritsLoading extends FavoritsState {}
