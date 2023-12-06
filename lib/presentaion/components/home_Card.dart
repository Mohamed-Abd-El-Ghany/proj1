import 'package:flutter/cupertino.dart';

import '../../app/appcolor.dart';

class HomeScreenCard extends StatelessWidget {
  HomeScreenCard({super.key,required this.name});

  String name ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(color: AppColors.whiteColor, fontSize: 18),
        ),
      ),
    );
  }
}
