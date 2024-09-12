import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/view_mdoel/validation_cubit/auth_validation_state.dart';

class AuthValidationCubit extends Cubit<AuthValidationState> {
  AuthValidationCubit() : super(AuthValidationInitialState());
  bool isValidateUserName = false;
  bool isValidatePassword = false;
  bool visibility = false;
  bool isValidateConfirmPassword = false;
  bool visibilityPassword = false;
  bool visibilityConfirmPassword = false;
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

  String? validateConfirmPassword(
      {required String? password, required String? confirmPassword}) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      isValidateConfirmPassword = true;
      emit(ValidateConfirmPasswordTrueSigUpState());
      return "❗ Password Error";
    } else if (confirmPassword != password) {
      isValidateConfirmPassword = false;
      emit(ValidateConfirmPasswordFalseSigUpState());
      return "PLease enter The Same Password ";
    } else {
      isValidateConfirmPassword = false;
      emit(ValidateConfirmPasswordFalseSigUpState());
      return null;
    }
  }

  toggleConfirmPasswordVisibility({required bool visibility}) {
    visibilityConfirmPassword = !visibility;
    emit(ToggleConfirmPasswordVisibilityAuthState());
  }
}
