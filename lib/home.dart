import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_api/cubit/states.dart';
import 'package:news_api/screens/search_screen.dart';
import 'cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {},
      builder:(context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              title: const Text("News App"),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(() => SearchScreen());
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeAppMode();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items:cubit.bottomItems,
          ),
        );
      },
    );
  }
}
