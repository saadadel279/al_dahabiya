import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);
    CacheHelper().saveData(key: 'counter', value: state);
  }

  void decrement() {
    if (state > 0) {
      emit(state - 1);
      CacheHelper().saveData(key: 'counter', value: state);
    }
  }

  int getCurrentState() {
    return state;
  }

  void reset() => emit(0);
}
