import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj1/data/cubits/popular_info_cubit/popular_info_cubit.dart';
import 'package:proj1/data/cubits/populer_cubit/popular_cubit.dart';
import 'package:proj1/presentaion/screens/home.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<PopularCubit>(
        create: (BuildContext context) => PopularCubit(),
      ),
      BlocProvider<PopularInfoCubit>(
        create: (BuildContext context) => PopularInfoCubit(),
      ),
    ],
     child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
