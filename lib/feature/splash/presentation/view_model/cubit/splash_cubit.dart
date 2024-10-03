import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:al_dahabiya/core/services/locator.dart';
import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<String> {
  SplashCubit() : super('');

  Future<void> startSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    final String? token = getIt<CacheHelper>().getData(key: ApiKey.token);

    if (token != null && token.isNotEmpty) {
      emit('home'); // Emit 'home' state if token exists
    } else {
      emit('login'); // Emit 'login' state if no token
    }
  }
}
