import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../models/most_ptoduct_model.dart';

class MostVisitedRepo {
  final ApiServices apiServices;
  MostVisitedModel? mostVisitedModel;
  MostVisitedRepo({required this.apiServices});
  Future<Either<String, MostVisitedModel?>> getMostVisited() async {
    try {
      var response = await apiServices.get(EndPoint.getMostVisited);
      if (response['code'] == 200) {
        mostVisitedModel = MostVisitedModel.fromJson(response);
        return right(mostVisitedModel!);
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
