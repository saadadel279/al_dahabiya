import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/home/data/models/slider_model.dart';
import 'package:dartz/dartz.dart';

class SliderRepo {
  final ApiServices apiServices;

  SliderRepo({required this.apiServices});

  Future<Either<String, SliderModel?>> getSlider() async {
    try {
      var response = await apiServices.get(EndPoint.getSlider);

      if (response['code'] == 200) {
        return Right(SliderModel.fromJson(response));
      } else {
        return Left(response['message']);
      }
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return const Left('something went wrong');
    }
  }
}
