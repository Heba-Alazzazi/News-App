import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Settings.dart';
import 'package:news_app/cache-helper.dart';
import 'package:news_app/business.dart';
import 'package:news_app/science.dart';
import 'package:news_app/sport.dart';
import 'package:news_app/cubit/states.dart';

import '../dio-helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(AppInitialState());
  static NewsCubit get(contexr) {
    return BlocProvider.of(contexr);
  }

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];
  List<Widget> screens = [Business(), Sport(), Science(), Settings()];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSport();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsChangeNavBar());
  }

  List<dynamic> business = [];
  void getBusiness() {
    DioHelper.getData(urlMethode: "v2/top-headlines", query: {
      "country": "us",
      "category": "business",
      "apiKey": "bb13543155b5477fb23999357d8d9e75",
    }).then((value) {
      business = value.data["articles"];

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErorrState(error));
    });
  }

  List<dynamic> sport = [];
  void getSport() {
    DioHelper.getData(urlMethode: "v2/top-headlines", query: {
      "country": "eg",
      "category": "sports",
      "apiKey": "bb13543155b5477fb23999357d8d9e75",
    }).then((value) {
      sport = value.data["articles"];

      emit(NewsGetSportSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportErorrState(error));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    DioHelper.getData(urlMethode: "v2/top-headlines", query: {
      "country": "eg",
      "category": "science",
      "apiKey": "bb13543155b5477fb23999357d8d9e75",
    }).then((value) {
      science = value.data["articles"];

      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErorrState(error));
    });
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    //search = [];
    DioHelper.getData(urlMethode: "v2/everything", query: {
      "q": "$value",
      "apiKey": "bb13543155b5477fb23999357d8d9e75",
    }).then((value) {
      search = value.data["articles"];

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErorrState(error));
    });
  }

  bool isDark = false;
  void chandeAppTheme(bool? fromShared) {
    // if (fromShared != null) {
    //   isDark = fromShared;
    //   emit(ChangeAppTheme());
    // } else {
    //   isDark = fromShared!;
    //   CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
    //     emit(ChangeAppTheme());
    //   });
    // }
    isDark = !isDark;
    emit(ChangeAppTheme());
  }
}
