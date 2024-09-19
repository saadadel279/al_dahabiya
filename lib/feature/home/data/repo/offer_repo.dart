import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/home/data/models/offers_model.dart';
import 'package:dartz/dartz.dart';

class OfferRepo {
  final ApiServices apiServices;
  OffersModel? offersModel;

  OfferRepo({required this.apiServices});
  Future<Either<String, OffersModel?>> getOffers() async {
    try {
      var response = await apiServices.get(EndPoint.getLatestOffers);
      if (response['code'] == 200) {
        offersModel = OffersModel.fromJson(response);
        return right(offersModel!);
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
