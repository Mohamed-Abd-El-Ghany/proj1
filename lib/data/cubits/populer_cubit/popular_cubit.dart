import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:proj1/data/requests/popular_request.dart';
import '../../../domain/models/popular_model.dart';
part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());
  static PopularCubit get(context) => BlocProvider.of(context);
  PopularModel popularModel = PopularModel();
  getPopular(){
    emit(PopularLoading());
    PopularRequest.getPopular(
        onSuccess: (res){
          popularModel=res;
          emit(PopularDone());
          },
        onError: (statusCode){
          emit(PopularError());
        },
    );
  }
}
