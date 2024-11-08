import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/Auth/featuers/update_password/data/model/update_password_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/api/api_services.dart';
import '../../../../../../core/api/end_point.dart';

class UpdataPasswordRepo {
  final ApiServices apiServices;

  UpdataPasswordRepo({required this.apiServices});

  Future<Either<String, UpdatePasswordModel>> updataPasswordRepo(
      String password) async {
    try {
      final response = await apiServices
          .post(EndPoint.updatePassword, body: {"password": password});
      if (response['code'] == 200) {
        return right(UpdatePasswordModel.fromJson(response));
      } else {
        return left(response['message']);
      }
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
