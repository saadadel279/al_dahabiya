import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/end_point.dart';
import '../model/my_orders_model,dart';

class MyOrdersRepo {
  final ApiServices apiServices;

  MyOrdersRepo({required this.apiServices});

  Future<Either<String, MyOrdersModel>> getmyOrders() async {
    try {
      var response = await apiServices.get(EndPoint.getMyOrders);
      if (response['code'] == 200) {
        return right(MyOrdersModel.fromJson(response));
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
