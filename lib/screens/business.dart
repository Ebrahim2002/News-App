import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/cubit.dart';
import 'package:news_api/cubit/states.dart';
import '../components/shared.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return NewsCubit()..getBusiness();
      },
      child: BlocConsumer<NewsCubit,NewsStates>(
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildRowItem(context, cubit.business[index]),
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                color: Colors.grey,
              ),
              itemCount: cubit.business.length,
            );
          },
          listener: (context, state) {

          },
      ),
    );
  }

}
