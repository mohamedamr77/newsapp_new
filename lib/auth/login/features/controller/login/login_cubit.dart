
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/auth/login/features/controller/login/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitialState());
  bool isValidateUserName=false;
  bool isValidatePassword=false;
  bool isCheckBox=false;

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
}