// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/news_cubit/cubit.dart';
import 'package:news_app/shared/cubit/news_cubit/states.dart';
import '../shared/cubit/app_cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.menu_open),
              SizedBox(width: 10.0),
              Text('News-ly'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                navigateTo(
                  context: context,
                  widget: SearchScreen(),
                );
              },
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).darkMode();
              },
              icon: Icon(
                AppCubit.get(context).iconData,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: NewsCubit.get(context).screenIndex,
          items: NewsCubit.get(context).bottomItems,
          onTap: (value) {
            NewsCubit.get(context).getIndex(index: value);
          },
        ),
        body:
            NewsCubit.get(context).screens[NewsCubit.get(context).screenIndex],
      ),
    );
  }
}
