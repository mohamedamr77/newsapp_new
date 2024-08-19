import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  bool isValidateUserName = false;
  bool isValidatePassword = false;
  bool visibility = false;
  bool remember = false;

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
}
