import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class Sport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sport;
        // return ListView.builder(
        // //   physics: BouncingScrollPhysics(),
        // //   itemCount: list.length,
        // //   itemBuilder: (context, index) =>
        // //       bulidArticalItem(list[index], context),
        // // );
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
