part of 'offers_cubit.dart';

@immutable
sealed class OffersState {}

final class OffersInitial extends OffersState {}

final class OffersLoading extends OffersState {}

final class OffersSuccess extends OffersState {
  final OffersModel? offersModel;
  OffersSuccess({required this.offersModel});
}

final class OffersFailure extends OffersState {
  final String? errMessage;

  OffersFailure({required this.errMessage});
}
