import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_api/home.dart';
import 'package:news_api/network/local/cache_helper.dart';
import 'package:news_api/network/remote/dio_helper.dart';
import 'package:news_api/theme_data.dart';
import 'cubit/cubit.dart';
import 'cubit/observer.dart';
import 'cubit/states.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   Bloc.observer = MyBlocObserver();
   DioHelper.init();
   await CacheHelper.init();
   bool? isDark = CacheHelper.getData('isDark');
   runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getSports()..getScience()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit,NewsStates>(
          builder: (context, state) {
            return  GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: NewsCubit.get(context).isDark ? Themes.darkMode : Themes.lightMode,
              home: const HomeScreen(),
            );
          },
          listener: (context, state) {

          },
      ),
    );
  }
}
