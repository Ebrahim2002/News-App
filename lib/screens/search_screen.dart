import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/shared.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
         var cubit= NewsCubit.get(context);
         var list = cubit.search;
          return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                surfaceTintColor: Colors.transparent,
                title: Container(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextFormField(
                      cursorColor: Colors.deepOrange,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      controller: cubit.searchController,
                      onFieldSubmitted: (value) {
                        cubit.getSearch(value);
                        // cubit.searchController.clear();
                      },
                      onChanged: (value) {
                        cubit.getSearch(value);
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Search',
                        contentPadding: EdgeInsets.only(left: 6),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ),
              ),
              body: Column(
                children: [
                  cubit.searchController.text !=''? Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildRowItem(context, list[index]),
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Divider(
                            height: 1,
                            color: Colors.grey[300],
                          ),
                        );
                      },
                      itemCount: list.length,
                    ),
                  ):Container(),
                ],
              )
          );
        }
        );
  }
}