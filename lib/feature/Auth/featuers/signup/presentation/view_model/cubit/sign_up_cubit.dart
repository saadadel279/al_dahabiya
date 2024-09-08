import 'package:al_dahabiya/feature/Auth/featuers/signup/data/model/sign_up.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/data/repo/Sign_up_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  final SignUpRepo signUpRepo;

  Future<void> signUp(
      {required String phone,
      required String password,
      required String email,
      required String firstName}) async {
    emit(SignUpLoading());
    final result = await signUpRepo.signUp(
      firstName,
      email,
      phone,
      password,
    );
    result.fold(
      (error) => emit(SignUpFaileur(errMessage: error)),
      (signUpModel) => emit(SignUpSucsess(signUpModel: signUpModel)),
    );
  }
}
