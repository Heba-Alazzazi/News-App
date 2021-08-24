import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc-opserver.dart';
import 'package:news_app/cache-helper.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/dio-helper.dart';
import 'package:news_app/newsApp.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/search.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // هاي بتضمن كل الاشياء الي قبل runApp تتنفذ
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: "isDark");
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getBusiness()
            ..getSport()
            ..getScience(),
        ),
        BlocProvider(
            create: (BuildContext context) =>
                NewsCubit()..chandeAppTheme(isDark)),
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor("333739"),
              primarySwatch: Colors.orange, // هاد لكل شي

              appBarTheme: AppBarTheme(
                backgroundColor: HexColor("333739"),
                elevation: 0.0,
                backwardsCompatibility: false, // علشان اقدر اتحكم بال ستيت
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor("333739"),
                    statusBarIconBrightness: Brightness.light),
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.orange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor("333739"),
              ),
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: Colors.orange),
              iconTheme: IconThemeData(color: Colors.white),
              primaryIconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),

            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light, // هان بتحكم بالثيم
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              primarySwatch: Colors.orange, // هاد لكل شي
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0.0,
                backwardsCompatibility: false, // علشان اقدر اتحكم بال ستيت
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.orange,
                elevation: 20.0,
              ),
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: Colors.orange),
              iconTheme: IconThemeData(color: Colors.black),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            home: News(isDark),
          );
        },
      ),
    );
  }
}
