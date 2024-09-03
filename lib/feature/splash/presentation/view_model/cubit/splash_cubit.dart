import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit() : super(null);
  void startSplashScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    emit(null);
  }
}
