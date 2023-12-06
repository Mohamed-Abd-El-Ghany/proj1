import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj1/app/appcolor.dart';
import 'package:proj1/app/apptext.dart';
import 'package:proj1/data/cubits/populer_cubit/popular_cubit.dart';
import 'package:proj1/presentaion/screens/details_screen.dart';

import '../components/home_Card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PopularCubit.get(context).getPopular();
    super.initState();
  }
  var x ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppText.popularlist,
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: BlocConsumer<PopularCubit, PopularState>(
        listener: (context, state) {
          state is PopularError?debugPrint("An Error Happened"):null;
        },
        builder: (context, state) {
          return state is PopularLoading?const Center(
            child: CircularProgressIndicator(color: AppColors.mainColor,),
          ):
            Padding(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: ListView.separated(
                itemBuilder: (context, i) {
                  return InkWell(
                    child: HomeScreenCard(
                      name: PopularCubit.get(context).popularModel.results?[i].name??"No Name",
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          builder) => InfoScreen(id: PopularCubit.get(context).popularModel.results?[i].id??x,
                          name: PopularCubit.get(context).popularModel.results?[i].name??"No Name")),
                      );
                    },
                  );
                },
                separatorBuilder: (context, i) {
                  return const SizedBox(height: 16);
                },
                itemCount: PopularCubit.get(context).popularModel.results!.length),
          );
        },
      ),
    );
  }
}
