import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj1/app/appconsts.dart';
import 'package:proj1/presentaion/screens/image.dart';

import '../../app/appcolor.dart';
import '../../app/apptext.dart';
import '../../data/cubits/popular_info_cubit/popular_info_cubit.dart';

class InfoScreen extends StatefulWidget {
  int id;
  String name;
  InfoScreen({super.key,required this.id,required this.name});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState(){
    PopularInfoCubit.get(context).getPopularInfo(id : widget.id);
    PopularInfoCubit.get(context).getPopularImages(id : widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularInfoCubit, PopularInfoState>(
  listener: (context, state) {
    state is PopularInfoError?debugPrint('An error occured'):null;
  },
  builder: (context, state) {
    return state is PopularInfoLoading||state is PopularImagesLoading?const Center(child: CircularProgressIndicator(
      color: AppColors.mainColor,
    ),):
      Scaffold(
      appBar: AppBar(
        title: Text(
          "${AppText.detailsAbout} ${widget.name}",
          style: const TextStyle(color: AppColors.whiteColor),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2 - 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Birthday:  ${PopularInfoCubit.get(context).popularInfoModel.birthday}',
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Place of birth:  ${PopularInfoCubit.get(context).popularInfoModel.placeOfBirth}',
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Gender:  ${PopularInfoCubit.get(context).popularInfoModel.gender}',
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Deathday:  ${PopularInfoCubit.get(context).popularInfoModel.deathday}',
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2 - 55,
              child: ListView.separated(
                itemBuilder: (context, i) {
                  return InkWell(
                    child: Image.network(
                      AppConsts.imageBaseUrl+PopularInfoCubit.get(context).imagesModel.profiles![i].filePath!,
                      height: 200,
                      width: 200,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => ImagePreview(
                        height: PopularInfoCubit.get(context).imagesModel.profiles![i].height??200,
                        width: PopularInfoCubit.get(context).imagesModel.profiles![i].width??200,
                        path: PopularInfoCubit.get(context).imagesModel.profiles![i].filePath??"",
                      )),
                      );
                    },
                  );
                },
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemCount: PopularInfoCubit.get(context).imagesModel.profiles!.length,
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
