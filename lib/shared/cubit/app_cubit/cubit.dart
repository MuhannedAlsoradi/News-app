import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/app_cubit/states.dart';

import '../../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  IconData iconData = Icons.light_mode;
  // dark mode method ...
  void darkMode({bool? fromShared}) {
    iconData = isDark ? Icons.dark_mode : Icons.light_mode;
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeMode());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeMode());
      });
    }
  }
}
