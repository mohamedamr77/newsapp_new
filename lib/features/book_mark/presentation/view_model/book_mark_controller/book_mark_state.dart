abstract class BookMarkState {}

class BookMarkInitialState extends BookMarkState{}
class BookMarkLoadingState extends BookMarkState{}
class BookMarkSuccessState extends BookMarkState{}
class BookMarkFaliureState extends BookMarkState{
  final String errorMessage;

  BookMarkFaliureState({required this.errorMessage});

}