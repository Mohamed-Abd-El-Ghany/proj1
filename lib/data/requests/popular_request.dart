import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:proj1/domain/models/images_model.dart';
import 'package:proj1/domain/models/popular_details_model.dart';

import '../../domain/models/popular_model.dart';

class PopularRequest {
  static void getPopular({
    required Function(PopularModel) onSuccess,
    required Function(int error) onError}) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b'),
      headers: headers,
    ).then((response) {
      if(
      response.statusCode==200
      ){
        Map<String,dynamic> decoded={};
        decoded = json.decode(response.body);
        PopularModel popularModel =PopularModel.fromJson(decoded);
        onSuccess(popularModel);
      }
      else{
        onError(response.statusCode);
      }
      log(response.statusCode.toString(),name: 'Status code of request :');
      log(response.body.toString(),name: 'Body Response :');
    },);
  }



  static void getPopularInfo({
    required int id,
    required Function(PopularInfoModel) onSuccess,
    required Function(int error) onError}) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b'),
      headers: headers,
    ).then((response) {
      if(
      response.statusCode==200
      ){
        Map<String,dynamic> decoded={};
        decoded = json.decode(response.body);
        PopularInfoModel popularInfoModel =PopularInfoModel.fromJson(decoded);
        onSuccess(popularInfoModel);
      }
      else{
        onError(response.statusCode);
      }
      log(response.statusCode.toString(),name: 'Status code of request :');
      log(response.body.toString(),name: 'Body Response :');
    },);
  }




  static void getPopularImages({
    required int id,
    required Function(ImagesModel) onSuccess,
    required Function(int error) onError}) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b'),
      headers: headers,
    ).then((response) {
      if(
      response.statusCode==200
      ){
        Map<String,dynamic> decoded={};
        decoded = json.decode(response.body);
        ImagesModel imagesModel =ImagesModel.fromJson(decoded);
        onSuccess(imagesModel);
      }
      else{
        onError(response.statusCode);
      }
      log(response.statusCode.toString(),name: 'Status code of request :');
      log(response.body.toString(),name: 'Body Response :');
    },);
  }


}
