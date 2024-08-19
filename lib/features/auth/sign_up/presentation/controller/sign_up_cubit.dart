import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());
  bool isValidateUserName = false;
  bool isValidatePassword = false;
  bool isValidateConfirmPassword = false;
  bool visibilityPassword = false;
  bool visibilityConfirmPassword = false;
   String? emailAddress;
   String? password;
  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      isValidateUserName = true;
      emit(ValidateUserNameTrueSigUpState());
      debugPrint("$isValidateUserName");
      return "❗ Invalid Username";
    } else {
      isValidateUserName = false;
      emit(ValidateUserNameFalseSigUpState());
      debugPrint("$isValidateUserName");
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      isValidatePassword = true;
      emit(ValidatePasswordTrueSigUpState());
      return "❗ Password Error";
    } else {
      isValidatePassword = false;
      emit(ValidatePasswordFalseSigUpState());
      return null;
    }
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      isValidateConfirmPassword = true;
      emit(ValidateConfirmPasswordTrueSigUpState());
      return "❗ Password Error";
    } else {
      isValidateConfirmPassword = false;
      emit(ValidateConfirmPasswordFalseSigUpState());
      return null;
    }
  }

  togglePasswordVisibility({required bool visibility}) {
    visibilityPassword = !visibility;
    emit(TogglePasswordVisibilitySignUpState());
  }

  toggleConfirmPasswordVisibility({required bool visibility}) {
    visibilityConfirmPassword = !visibility;
    emit(ToggleConfirmPasswordVisibilitySignUpState());
  }

  fireBaseSignUp()async{
    emit(SignUpLoadingState());

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFaliureState(error: "Error Firebase ${e.code}"));
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFaliureState(error: "Error Firebase ${e.code}"));
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      emit(SignUpFaliureState(error: "Error Firebase $e"));
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
