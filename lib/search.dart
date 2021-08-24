import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components.dart';
import 'package:news_app/cubit/cubit.dart';

import 'cubit/states.dart';

class Search extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: DefaultTextField(
                    label: "Search",
                    controller: searchController,
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    type: TextInputType.text,
                    icon: Icons.search,
                    onTap: () {},
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    }),
              ),
              Expanded(
                child:
                    //     bulidArticalItem(list[index], context)
                    ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      bulidArticalItem(list[index], context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
