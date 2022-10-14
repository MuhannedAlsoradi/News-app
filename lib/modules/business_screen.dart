// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/news_cubit/cubit.dart';
import 'package:news_app/shared/cubit/news_cubit/states.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: NewsCubit.get(context).business.isNotEmpty,
          builder: (context) => ScreenTypeLayout(
            mobile: Builder(builder: (context) {
              NewsCubit.get(context).setDesktop(value: false);
              return buildListView(context: context, list: list);
            }),
            desktop: Builder(builder: (context) {
              NewsCubit.get(context).setDesktop(value: true);
              return Row(
                children: [
                  Expanded(
                    child: buildListView(context: context, list: list),
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      color: Colors.grey[200],
                      child: Text(
                          '${list[NewsCubit.get(context).selectedArticleIndex]['description']}'),
                    ),
                  )
                ],
              );
            }),
            breakpoints:
                ScreenBreakpoints(desktop: 600, tablet: 600, watch: 200),
          ),
          fallback: (BuildContext context) =>
              Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
