import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  bool isValidateUserName = false;
  bool isValidatePassword = false;
  bool visibility = false;
  bool remember = false;

  String? emailAddress;
  String? password;

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      isValidateUserName = true;
      emit(ValidationNameTrueState());
      debugPrint("$isValidateUserName");
      return "❗ Invalid Username";
    } else {
      isValidateUserName = false;
      emit(ValidationNameFalseState());
      debugPrint("$isValidateUserName");
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      isValidatePassword = true;
      emit(ValidationPasswordTrueState());
      return "❗ Password Error";
    } else {
      isValidatePassword = false;
      emit(ValidationPasswordFalseState());
      return null;
    }
  }

  togglePasswordVisibility({required bool visibility}) {
    this.visibility = visibility;
    emit(TogglePasswordVisibilityState());
  }

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
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(LoginFaliureState(errorMessage: e.code));
        print('Wrong password provided for that user.');
      } else if ((e.code == 'invalid-credential')) {
        emit(
            LoginFaliureState(errorMessage: "Please Check email and password"));
      } else {
        emit(LoginFaliureState(errorMessage: e.code));
      }
    }
  }
}
