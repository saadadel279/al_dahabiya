import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/error/exceptions.dart';
import 'package:al_dahabiya/feature/order_request/data/models/order_request_model.dart';
import 'package:al_dahabiya/feature/order_request/data/models/order_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/api_services.dart';

class OrderRequestRepo {
  final ApiServices apiServices;
  OrderRequestModel? orderRequestModel;

  OrderRequestRepo({required this.apiServices});

  Future<Either<String, OrderResponseModel?>> orderRequest() async {
    try {
      var response = await apiServices.post(
        EndPoint.orderRequest,
        body: orderRequestModel!.toJson(),
      );
      if (response['code'] == 200) {
        return right(OrderResponseModel.fromJson(response));
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
