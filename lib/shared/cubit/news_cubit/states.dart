abstract class NewsStates {}

class AppInitialState extends NewsStates {}

class AppBottomNavBarState extends NewsStates {}

class AppGetBusinessSuccessState extends NewsStates {}

class AppGetBusinessLoadingState extends NewsStates {}

class AppGetBusinessErrorState extends NewsStates {
  final error;
  AppGetBusinessErrorState(this.error);
}

class AppGetSportsSuccessState extends NewsStates {}

class AppGetSportsLoadingState extends NewsStates {}

class AppGetSportsErrorState extends NewsStates {
  final error;
  AppGetSportsErrorState(this.error);
}

class AppGetSienceSuccessState extends NewsStates {}

class AppGetSienceLoadingState extends NewsStates {}

class AppGetSienceErrorState extends NewsStates {
  final error;
  AppGetSienceErrorState(this.error);
}

class AppGetSearchSuccessState extends NewsStates {}

class AppGetSearchLoadingState extends NewsStates {}

class AppGetSearchErrorState extends NewsStates {
  final error;
  AppGetSearchErrorState(this.error);
}

class SelectArticleItemState extends NewsStates {}

class DesktopState extends NewsStates {}
