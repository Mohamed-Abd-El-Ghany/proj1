import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:proj1/data/requests/popular_request.dart';
import 'package:proj1/domain/models/images_model.dart';

import '../../../domain/models/popular_details_model.dart';

part 'popular_info_state.dart';

class PopularInfoCubit extends Cubit<PopularInfoState> {
  PopularInfoCubit() : super(PopularInfoInitial());
  static PopularInfoCubit get(context)=> BlocProvider.of(context);
  PopularInfoModel popularInfoModel = PopularInfoModel();
  ImagesModel imagesModel = ImagesModel();
  getPopularInfo({required int id})
  {
    emit(PopularInfoLoading());
    PopularRequest.getPopularInfo(id: id,
        onSuccess: (res){
      popularInfoModel = res;
      emit(PopularInfoDone());
        },
        onError: (statusCode){
      emit(PopularInfoError());
      log(statusCode);
        });
  }
  getPopularImages({required int id})
  {
    emit(PopularImagesLoading());
    PopularRequest.getPopularImages(id: id,
        onSuccess: (res){
          imagesModel = res;
          emit(PopularImagesDone());
        },
        onError: (statusCode){
          emit(PopularImagesError());
          log(statusCode);
        });
  }
}
