import 'package:al_dahabiya/core/models/offers_model.dart';
import 'package:al_dahabiya/feature/home/data/repo/offer_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this.offerRepo) : super(OffersInitial());
  final OfferRepo offerRepo;

  Future<void> getOffers() async {
    emit(OffersLoading());
    final result = await offerRepo.getOffers();
    result.fold(
      (error) => emit(OffersFailure(errMessage: error)),
      (offers) => emit(OffersSuccess(offersModel: offers)),
    );
  }
}
