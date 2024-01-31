import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:news_api/network/local/cache_helper.dart';
import 'package:news_api/screens/science.dart';
import 'package:news_api/screens/sports.dart';
import '../network/remote/dio_helper.dart';
import '../screens/business.dart';
class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController=TextEditingController();
  int currentIndex = 0;

  void dispose(){
    searchController.dispose();
    super.close();
  }
  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  ];
  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index ;
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if(business.isEmpty)
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country':'us',
              'category':'business',
              'apiKey':'e875c7083fd5491b9623d443c11c6fa9',
            }
        ).then((value) {
          business = value!.data['articles'];
          emit(NewsGetBusinessSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(NewsGetBusinessErrorState(error.toString()));
        });
      }else{
      emit(NewsGetBusinessSuccessState());
    }
  }
void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'us',
            'category':'sports',
            'apiKey':'e875c7083fd5491b9623d443c11c6fa9',
          }
      ).then((value) {
        sports = value!.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }
void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'us',
            'category':'science',
            'apiKey':'e875c7083fd5491b9623d443c11c6fa9',
          }
      ).then((value) {
        science = value!.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }
  List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    if(search.isEmpty){
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q':value,
            'apiKey':'e875c7083fd5491b9623d443c11c6fa9',
          }
      ).then((value) {
        search = value!.data['articles'];
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetSearchSuccessState());
    }
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}){
    if(fromShared != null){
      isDark = fromShared;
      emit(ChangeAppThemeState());
    }else{
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppThemeState());
      });
    }
  }

  // void changeAppMode(){
  //   if(Get.isDarkMode){
  //     Get.changeTheme(Themes.lightMode);
  //     CacheHelper.putData(key: 'isDark', value: false);
  //   }else{
  //     Get.changeTheme(Themes.darkMode);
  //     CacheHelper.putData(key: 'isDark', value: true);
  //   }
  //   emit(ChangeAppThemeState());
  // }
}