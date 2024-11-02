import 'package:al_dahabiya/feature/address/data/models/city_model.dart';
import 'package:al_dahabiya/feature/address/data/models/zone_model.dart';
import 'package:al_dahabiya/feature/address/data/repo/address_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/added_address_model.dart';
import '../../../data/models/government_model.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this.addressRepo) : super(AddressInitial());

  final AddressRepo addressRepo;

  Future<void> getGovernments() async {
    emit(GovernmentLoading());
    var response = await addressRepo.getGovernments();
    response.fold((error) {
      emit(GovernmentFailure(errMessage: error));
    }, (govern) {
      emit(GovernmentSuccess(governmentData: govern));
    });
  }

  Future<void> getCitys({required int governId}) async {
    emit(CitysLoading());
    var response = await addressRepo.getCitys(governId: governId);
    response.fold((error) {
      emit(CitysFailure(errMessage: error));
    }, (city) {
      emit(CitysSuccess(cityData: city));
    });
  }

  Future<void> getZones({required int cityId}) async {
    emit(ZonesLoading());
    var response = await addressRepo.getZones(cityId: cityId);
    response.fold((error) {
      emit(ZonesFailure(errMessage: error));
    }, (zone) {
      emit(ZonesSuccess(zoneData: zone));
    });
  }

  Future<void> addAddress(
      int governmentId, int cityId, int zoneId, String address) async {
    emit(AddAddressLoading());
    var response =
        await addressRepo.addAddress(governmentId, cityId, zoneId, address);
    response.fold((error) {
      emit(AddAddressFailure(errMessage: error));
    }, (addedAddress) {
      emit(AddAddressSuccess(addressModel: addedAddress));
    });
  }
}
