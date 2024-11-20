import 'package:al_dahabiya/core/api/api_services.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/end_point.dart';
import '../../../../core/error/exceptions.dart';
import '../models/search_model.dart';

class SearchRepo{
  final ApiServices apiServices;

  SearchRepo({required this.apiServices});

 Future<Either<String,SearchModel?>> search(String item) async{
   try {
     var response = await apiServices.get("${EndPoint.getSearchProduct}$item");
     if (response['code'] == 200) {
       return right(SearchModel.fromJson(response));
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