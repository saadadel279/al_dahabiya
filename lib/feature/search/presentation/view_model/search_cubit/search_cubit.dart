import 'package:al_dahabiya/feature/search/data/models/search_model.dart';
import 'package:al_dahabiya/feature/search/data/repo/search_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;


  Future<void>search(String item)async{
    emit(SearchLoading());
    var response =await searchRepo.search(item);
    response.fold((errMessage) {
      emit(SearchFailuer(errMessage: errMessage));
    }, (searchModel) {
      emit(SearchSuccess(searchModel: searchModel));
    },);
  }
}
