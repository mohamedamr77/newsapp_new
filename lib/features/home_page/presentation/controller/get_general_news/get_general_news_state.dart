abstract class GetGeneralNewsState {}

class GetGeneralNewsInitialState extends GetGeneralNewsState {}

class GetGeneralNewsLoadingState extends GetGeneralNewsState {}

class GetGeneralNewsSuccessState extends GetGeneralNewsState {}

class GetGeneralNewsFaliureState extends GetGeneralNewsState {
  final String errorMessage;
  GetGeneralNewsFaliureState({required this.errorMessage});
}
