import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsappcode/features/auth/sign_up/data/sign_up_implement.dart';
import 'package:newsappcode/features/auth/sign_up/data/sign_up_repo.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/failure.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitialState());
  String? emailAddress;
  String? password;
  String? confirmPassword;
    bool isLoading=false;

    final SignUpRepo signUpRepo;

  fireBaseSignUp() async {
    emit(SignUpLoadingState());
     isLoading=true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
      isLoading=false;
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        isLoading=false;
        emit(SignUpFaliureState(
            error: "Weak password, please use a stronger password."));
      } else if (e.code == 'email-already-in-use') {
        isLoading=false;
        emit(SignUpFaliureState(
            error: "Email already in use, please try another one."));
      } else {
        isLoading=false;
        // Handle other FirebaseAuthException codes
        emit(SignUpFaliureState(error: "Authentication failed: ${e.message}"));
      }
    } catch (e) {
      isLoading=false;
      // Catch any other exceptions
      emit(SignUpFaliureState(error: "An unexpected error occurred: $e"));
    }
  }

    signInWithGoogle() async {
      isLoading=true;
      emit(SignUpLoadingWithGoogleState());
   var result= await signUpRepo.signInWithGoogle();
   result.fold(
           (error){
             emit(SignUpFaliureWithGoogleState(error: error.message));
           },
           (success){
             emit(SignUpSuccessWithGoogleState());
           });

  }
}

/*
   emit(SignUpLoadingWithGoogleState());
      isLoading=true;
    try {
      isLoading=false;

      emit(SignUpSuccessWithGoogleState());
    } on FirebaseAuthException catch (e) {
      isLoading=false;
      emit(SignUpFaliureWithGoogleState(error: 'Error : ${e.code}'));
      // Handle specific FirebaseAuth exceptions if needed
    } catch (e) {
      isLoading=false;
      emit(SignUpFaliureWithGoogleState(error: 'Error : $e'));
    }

    // Return null in case of any error or exception
    return null;
 */