import 'package:flutter/material.dart';
import 'package:proj1/app/appconsts.dart';

import '../../app/appcolor.dart';

class ImagePreview extends StatelessWidget {
  String path;
  num height,width;
  ImagePreview({super.key,required this.path,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.download,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            AppConsts.imageBaseUrl+path,
            height: double.parse(height.toString()),
            width: double.parse(width.toString()),
          )
        ],
      ),
    );
  }
}
