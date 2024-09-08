import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/core/services/locator.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

class LoginRepo {
  final ApiServices apiServices;
  LoginModel? user;

  LoginRepo({required this.apiServices});

  Future<Either<String, LoginModel?>> login(
      String phone, String password) async {
    try {
      final response = await apiServices
          .post(EndPoint.login, body: {"phone": phone, "password": password});
      if (response['code'] == 200) {
        user = LoginModel.fromJson(response);
        getIt<CacheHelper>()
            .saveData(key: ApiKey.token, value: user!.data.token);

        return right(user);
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
