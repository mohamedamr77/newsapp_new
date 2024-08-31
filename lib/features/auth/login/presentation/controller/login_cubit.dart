import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  bool remember = false;

  String? emailAddress;
  String? password;

  toggleRememberMeValue({required bool remember}) {
    this.remember = remember;
    emit(ToggleRememberMeState());
  }

  fireBaseSignIn() async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFaliureState(errorMessage: e.code));
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        emit(LoginFaliureState(errorMessage: e.code));
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      } else if ((e.code == 'invalid-credential')) {
        emit(
            LoginFaliureState(errorMessage: "Please Check email and password"));
      } else {
        emit(LoginFaliureState(errorMessage: e.code));
      }
    }
  }

  forgetThePassword({required BuildContext context})async{
    emit(ForgetThePasswordMessageLoadingState());
    try {
      final email = emailAddress;
      if (email == null || email.isEmpty) {
        // Emit a state indicating that the email was not provided
        emit(ForgetThePasswordMessageNotSentState(
            message: 'Please provide your email address.'));
        return;
      }

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // Emit a state indicating success
      emit(ForgetThePasswordMessageSentSuccessfullyState());
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'No user found with this email address.';
      } else {
        errorMessage = 'An error occurred. Please try again.';
      }

      // Emit a state indicating failure with the error message
      emit(ForgetThePasswordMessageNotSentState(message: errorMessage));
    } catch (e) {
      // Handle any other errors and emit a failure state
      emit(ForgetThePasswordMessageNotSentState(
          message: 'An unexpected error occurred. Please try again.'));
    }
  }

}
