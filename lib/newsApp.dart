import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/search.dart';

class News extends StatelessWidget {
  bool? isDark;
  News(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(" New News "),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                  icon: Icon(Icons.search),
                  color: cubit.isDark ? Colors.white : Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    cubit.chandeAppTheme(isDark);
                    // NewsCubit.get(context).isDark =
                    //     !NewsCubit.get(context).isDark;
                  },
                  icon: Icon(Icons.brightness_4_outlined),
                  color: cubit.isDark ? Colors.white : Colors.black,
                )
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItem,
              onTap: (value) {
                cubit.changeBottomNavBar(value);
              },
            ),
          );
        });
  }
}
