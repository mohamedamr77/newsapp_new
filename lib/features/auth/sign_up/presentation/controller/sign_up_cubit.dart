import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/sign_up/data/sign_up_repo.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_state.dart';


class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitialState());
  String? emailAddress;
  String? password;
  String? confirmPassword;
  bool isLoading = false;

  final SignUpRepo signUpRepo;

  fireBaseSignUp() async {
    emit(SignUpLoadingState());
    isLoading = true;
     var result= await signUpRepo.fireBaseSignUp(emailAddress: emailAddress!.trim(), password: password!.trim());
      result.fold((error){
        isLoading = false;
        emit(SignUpFaliureState(error: "An unexpected error occurred: $error"));
      }, (success){
        isLoading = false;
        emit(SignUpSuccessState());
      });
  }

  signInWithGoogle() async {
    isLoading = true;
    emit(SignUpLoadingWithGoogleState());
    var result = await signUpRepo.signInWithGoogle();
    result.fold((error) {
      isLoading = false;
      emit(SignUpFaliureWithGoogleState(error: error.message));
    }, (success) {
      isLoading = false;
      emit(SignUpSuccessWithGoogleState());
    });
  }
}