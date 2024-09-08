import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/data/model/sign_up.dart';
import 'package:dartz/dartz.dart';

class SignUpRepo {
  final ApiServices apiServices;

  SignUpRepo({required this.apiServices});
  Future<Either<String, SignUpModel?>> signUp(
    String firstName,
    String email,
    String phone,
    String password,
  ) async {
    try {
      final response = await apiServices.post(EndPoint.signUp, body: {
        "first_name": firstName,
        "email": email,
        "phone": phone,
        "password": password
      });
      if (response['code'] == 200) {
        return right(SignUpModel.fromJson(response));
      } else {
        return left(response['message']);
      }
    } on ServerException catch (e) {
      return left(e.errModel.message);
    } catch (e) {
      return left('هناك خطأ ما');
    }
  }
}
