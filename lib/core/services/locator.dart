import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
