import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
//import 'package:conditional_builder/conditional_builder.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).business;
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        // return ListView.builder(
        //   physics: BouncingScrollPhysics(),
        //   itemCount: list.length,
        //   itemBuilder: (context, index) =>
        //       bulidArticalItem(list[index], context),
        // );
        // return ConditionalBuilder(
        //   condition: list.length > 0,
        //   builder: (context) => ListView.builder(
        //     physics: BouncingScrollPhysics(),
        //     itemBuilder: (context, index) =>
        //         bulidArticalItem(list[index], context),
        //     itemCount: list.length,
        //   ),
        //   fallback: (context) => Center(child: CircularProgressIndicator()),
        // );
        return list.length > 0
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    bulidArticalItem(list[index], context),
                itemCount: list.length,
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
