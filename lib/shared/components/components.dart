// ignore_for_file: prefer_const_constructor

import 'package:flutter/material.dart';
import 'package:news_app/shared/cubit/news_cubit/cubit.dart';

Widget buildArticleItem(article, context, index) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: NewsCubit.get(context).selectedArticleIndex == index &&
                NewsCubit.get(context).isDesktop
            ? Colors.grey[200]
            : null,
        child: InkWell(
          // onTap: () => navigateTo(
          //   context: context,
          //   widget: WebVeiwScreen(url: article['url'], name: article['auther']),
          // ),
          onTap: () {
            NewsCubit.get(context).selectedArticleItem(index);
          },
          child: Row(
            children: [
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      article['urlToImage'].toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              Expanded(
                child: Container(
                  height: 120.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          article['title'],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Text(
                        article['publishedAt'],
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
Widget myDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 0.5,
        width: double.infinity,
        color: Colors.grey,
      ),
    );
Widget buildListView({required BuildContext context, required List list}) =>
    ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          buildArticleItem(list[index], context, index),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: list.length,
    );
void navigateTo({required BuildContext context, required Widget widget}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
