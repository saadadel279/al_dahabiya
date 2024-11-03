import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/address/data/models/city_model.dart';
import 'package:al_dahabiya/feature/address/data/models/government_model.dart';
import 'package:al_dahabiya/feature/address/data/models/zone_model.dart';
import 'package:dartz/dartz.dart';

import '../models/added_address_model.dart';
import '../models/user_address_model.dart';

class AddressRepo {
  final ApiServices apiServices;

  AddressRepo({required this.apiServices});

  Future<Either<String, List<GovernmentData>?>> getGovernments() async {
    try {
      var response = await apiServices.get(EndPoint.getGovernments);
      if (response['code'] == 200) {
        return right(GovernmentModel.fromJson(response).data);
      } else {
        return left(response['message']);
      }
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('something went wrong');
    }
  }

  Future<Either<String, List<CityData>?>> getCitys(
      {required int governId}) async {
    try {
      var response = await apiServices.get(
        '${EndPoint.getCitys}/$governId',
      );
      if (response['code'] == 200) {
        return right(CityModel.fromJson(response).data);
      } else {
        return left(response['message']);
      }
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('something went wrong');
    }
  }

  Future<Either<String, List<ZoneData>?>> getZones(
      {required int cityId}) async {
    try {
      var response = await apiServices.get(
        '${EndPoint.getZones}/$cityId',
      );
      if (response['code'] == 200) {
        return right(ZoneModel.fromJson(response).data);
      } else {
        return left(response['message']);
      }
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('something went wrong');
    }
  }

  Future<Either<String, AddedAddressModel?>> addAddress(
      int governmentId, int cityId, int zoneId, String address) async {
    try {
      var response = await apiServices.post(EndPoint.postAddress, body: {
        "government_id": governmentId,
        "city_id": cityId,
        "zone_id": zoneId,
        "address": address
      });
      if (response['code'] == 200) {
        return right(AddedAddressModel.fromJson(response));
      } else {
        return left(response['message']);
      }
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('something went wrong');
    }
  }

  Future<Either<String, List<AddressData>?>> getUserAddress() async {
    try {
      var response = await apiServices.get(EndPoint.useraddresses);
      if (response['code'] == 200) {
        return right(UserAddressModel.fromJson(response).data);
      } else {
        return left(response['message']);
      }
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('something went wrong');
    }
  }
}
