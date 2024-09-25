abstract class SearchNewsState {}

class SearchNewsInitialState extends SearchNewsState {}

class SearchNewsLoadingState extends SearchNewsState {}

class SearchNewsFaliureState extends SearchNewsState {
  final String errorMessage;
  SearchNewsFaliureState({required this.errorMessage});
}

class SearchNewsSuccessState extends SearchNewsState {}
