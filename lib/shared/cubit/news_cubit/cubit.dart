// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/news_cubit/states.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import '../../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(AppInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int screenIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business_outlined,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_outlined,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science_outlined,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings_outlined,
      ),
      label: 'Settings',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  List<dynamic> business = [];
  List<bool> businessItems = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];
// get index method...
  void getIndex({required int index}) {
    screenIndex = index;
    emit(AppBottomNavBarState());
  }

// getDio business method...
  void getDioBusiness() {
    emit(AppGetBusinessLoadingState());
    DioHelper.getDio(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    )?.then((value) {
      emit(AppGetBusinessSuccessState());
      business = value.data['articles'];
      // value.forEach((element) {
      //   businessItems.add(true);
      // });
    }).catchError((error) {
      emit(AppGetBusinessErrorState(error));
    });
  }

  // getDio sports method...
  void getDioSports() {
    emit(AppGetSportsLoadingState());
    DioHelper.getDio(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    )?.then((value) {
      emit(AppGetSportsSuccessState());
      sports = value.data['articles'];
    }).catchError((error) {
      emit(AppGetSportsErrorState(error));
    });
  }

  // getDio science method...
  void getDioScience() {
    emit(AppGetSienceLoadingState());
    DioHelper.getDio(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    )?.then((value) {
      emit(AppGetSienceSuccessState());
      science = value.data['articles'];
    }).catchError((error) {
      emit(AppGetSienceErrorState(error));
    });
  }

  // search method ...
  void getDioSearch({required String value}) {
    emit(AppGetSearchLoadingState());
    DioHelper.getDio(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    )?.then((value) {
      emit(AppGetSearchSuccessState());
      search = value.data['articles'];
    }).catchError((error) {
      emit(AppGetSearchErrorState(error));
    });
  }

  int selectedArticleIndex = 0;
  void selectedArticleItem(int index) {
    selectedArticleIndex = index;
    emit(SelectArticleItemState());
  }

  bool isDesktop = false;
  void setDesktop({required bool value}) {
    isDesktop = value;
    emit(DesktopState());
  }
}
