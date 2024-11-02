part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class GovernmentLoading extends AddressState {}

final class GovernmentSuccess extends AddressState {
  final List<GovernmentData>? governmentData;

  GovernmentSuccess({required this.governmentData});
}

final class GovernmentFailure extends AddressState {
  final String errMessage;

  GovernmentFailure({required this.errMessage});
}

final class CitysLoading extends AddressState {}

final class CitysSuccess extends AddressState {
  final List<CityData>? cityData;

  CitysSuccess({required this.cityData});
}

final class CitysFailure extends AddressState {
  final String errMessage;

  CitysFailure({required this.errMessage});
}

final class ZonesLoading extends AddressState {}

final class ZonesSuccess extends AddressState {
  final List<ZoneData>? zoneData;

  ZonesSuccess({required this.zoneData});
}

final class ZonesFailure extends AddressState {
  final String errMessage;

  ZonesFailure({required this.errMessage});
}

final class AddAddressLoading extends AddressState {}

final class AddAddressSuccess extends AddressState {
  final AddedAddressModel? addressModel;

  AddAddressSuccess({required this.addressModel});
}

final class AddAddressFailure extends AddressState {
  final String errMessage;

  AddAddressFailure({required this.errMessage});
}
