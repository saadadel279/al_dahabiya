import 'package:al_dahabiya/feature/Auth/featuers/update_password/data/repo/updata_password_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/update_password_model.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit(this.updataPasswordRepo) : super(UpdatePasswordInitial());
  final UpdataPasswordRepo updataPasswordRepo;

  Future<void> updatePassword(String password) async {
    emit(UpdatePasswordLoading());
    final result = await updataPasswordRepo.updataPasswordRepo(password);
    result.fold((error) {
      emit(UpdatePasswordFaileur(errMessage: error));
    }, (suc) {
      emit(UpdatePasswordSuccess(updatePasswordModel: suc));
    });
  }
}
