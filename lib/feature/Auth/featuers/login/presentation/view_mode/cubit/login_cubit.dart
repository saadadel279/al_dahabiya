import 'package:al_dahabiya/feature/Auth/featuers/login/data/model/login_model.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/data/repo/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  Future<void> login({required String phone, required String password}) async {
    emit(LoginLoading());
    final result = await loginRepo.login(phone, password);
    result.fold(
      (error) => emit(LoginFaileur(errMessage: error)),
      (user) => emit(LoginSucsess(loginModel: user)),
    );
  }
}
