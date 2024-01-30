import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/shared.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        if(cubit.science.isEmpty) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return shimmerCard(context);
            },
            itemCount: 4,
          );
        }
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildRowItem(context, cubit.science[index]
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            color: Colors.grey,
          ),
          itemCount: cubit.science.length,
        );
      },
      listener: (context, state) {

      },
    );
  }
}