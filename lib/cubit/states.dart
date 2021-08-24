abstract class NewsState {}

class AppInitialState extends NewsState {}

class NewsChangeNavBar extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsBusinessLoadingState extends NewsState {}

class NewsGetBusinessErorrState extends NewsState {
  var error;
  NewsGetBusinessErorrState(this.error);
}

class NewsGetSportSuccessState extends NewsState {}

class NewsGetSportLoadingState extends NewsState {}

class NewsGetSportErorrState extends NewsState {
  var error;
  NewsGetSportErorrState(this.error);
}

class NewsGetScienceSuccessState extends NewsState {}

class NewsGetScienceLoadingState extends NewsState {}

class NewsGetScienceErorrState extends NewsState {
  var error;
  NewsGetScienceErorrState(this.error);
}

class ChangeAppTheme extends NewsState {}

class NewsGetSearchSuccessState extends NewsState {}

class NewsGetSearchoadingState extends NewsState {}

class NewsGetSearchErorrState extends NewsState {
  var error;
  NewsGetSearchErorrState(this.error);
}
