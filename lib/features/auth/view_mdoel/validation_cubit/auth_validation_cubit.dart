import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/view_mdoel/validation_cubit/auth_validation_state.dart';

class AuthValidationCubit extends Cubit<AuthValidationState> {
  AuthValidationCubit() : super(AuthValidationInitialState());
  bool isValidateUserNameLogin = false;
  bool isValidatePasswordLogin = false;
  bool isValidateUserNameSignUp = false;
  bool isValidatePasswordSignUP = false;
  bool visibility = false;
  bool isValidateConfirmPassword = false;
  bool visibilityPassword = false;
  bool visibilityConfirmPassword = false;
  String? validateUserNameLogin(String? value) {
    if (value == null || value.isEmpty) {
      isValidateUserNameLogin = true;
      emit(LoginValidationNameTrueState());
      debugPrint("$isValidateUserNameLogin");
      return "❗ Invalid Username";
    } else {
      isValidateUserNameLogin = false;
      emit(LoginValidationNameFalseState());
      debugPrint("$isValidateUserNameLogin");
      return null;
    }
  }

  String? validatePasswordLogin(String? value) {
    if (value == null || value.isEmpty) {
      isValidatePasswordLogin = true;
      emit(LoginValidationPasswordTrueState());
      return "❗ Password Error";
    } else {
      isValidatePasswordLogin = false;
      emit(LoginValidationPasswordFalseState());
      return null;
    }
  }

  String? validateUserNameSignUp(String? value) {
    if (value == null || value.isEmpty) {
      isValidateUserNameSignUp = true;
      emit(LoginValidationNameTrueState());
      debugPrint("$isValidateUserNameSignUp");
      return "❗ Invalid Username";
    } else {
      isValidateUserNameSignUp = false;
      emit(LoginValidationNameFalseState());
      debugPrint("$isValidateUserNameSignUp");
      return null;
    }
  }

  String? validatePasswordSignUp(String? value) {
    if (value == null || value.isEmpty) {
      isValidateUserNameSignUp = true;
      emit(LoginValidationPasswordTrueState());
      return "❗ Password Error";
    } else {
      isValidateUserNameSignUp = false;
      emit(LoginValidationPasswordFalseState());
      return null;
    }
  }

  togglePasswordVisibility({required bool visibility}) {
    this.visibility = visibility;
    emit(LoginTogglePasswordVisibilityState());
  }

  String? validateConfirmPassword({required String? password, required String? confirmPassword}) {
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
