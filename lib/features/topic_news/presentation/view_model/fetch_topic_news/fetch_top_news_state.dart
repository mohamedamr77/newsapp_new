abstract class FetchTopicNewsState {}

class FetchTopicNewsInitialState extends FetchTopicNewsState {}

class FetchTopicNewsLoadingState extends FetchTopicNewsState {}

class FetchTopicNewsFaliureState extends FetchTopicNewsState {
  final String errorMessage;
  FetchTopicNewsFaliureState({required this.errorMessage});
}

class FetchTopicNewsSuccessState extends FetchTopicNewsState {}
class FetchTopicNewsPaginationLoadingState extends FetchTopicNewsState {}
class FetchTopicNewsPaginationFailedState extends FetchTopicNewsState {}
