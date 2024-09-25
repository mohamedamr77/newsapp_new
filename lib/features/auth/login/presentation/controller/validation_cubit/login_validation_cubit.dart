import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/login/presentation/controller/validation_cubit/login_validation_state.dart';

class LoginValidationCubit extends Cubit<LoginValidationState> {
  LoginValidationCubit() : super(LoginValidationState());

  bool isValidateUserName = false;
  bool isValidatePassword = false;
  bool visibility = false;

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      isValidateUserName = true;
      emit(LoginValidationNameTrueState());
      debugPrint("$isValidateUserName");
      return "❗ Invalid Username";
    } else {
      isValidateUserName = false;
      emit(LoginValidationNameFalseState());
      debugPrint("$isValidateUserName");
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      isValidatePassword = true;
      emit(LoginValidationPasswordTrueState());
      return "❗ Password Error";
    } else {
      isValidatePassword = false;
      emit(LoginValidationPasswordFalseState());
      return null;
    }
  }

  togglePasswordVisibility({required bool visibility}) {
    this.visibility = visibility;
    emit(LoginTogglePasswordVisibilityState());
  }
}
