import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/states.dart';

import 'cubit/cubit.dart';
import 'network/remote/dio_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return NewsCubit();
      },
      child: BlocConsumer<NewsCubit,NewsStates>(
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
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                   cubit.getBusiness();
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
      ),
    );
  }
}
