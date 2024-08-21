import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/validation_cubit/validation_sign_up_state.dart';

class ValidationSignUpCubit extends Cubit<ValidationSignUpState> {
  ValidationSignUpCubit() : super(ValidationSignUpInitialState());
  bool isValidateUserName = false;
  bool isValidatePassword = false;
  bool isValidateConfirmPassword = false;

  bool visibilityPassword = false;
  bool visibilityConfirmPassword = false;

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      isValidateUserName = true;
      if (kDebugMode) {
        print(isValidateUserName);
      }
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

  String? validatePassword({required String? password }) {
    if (password == null || password.isEmpty ) {
      isValidatePassword = true;
      emit(ValidatePasswordTrueSigUpState());
      return "❗ Password Error";
    } else {
    isValidatePassword = false;
    emit(ValidatePasswordFalseSigUpState());
    return null;
    }
  }
  /*
  else if (password!=confirmPassword ) {
      isValidatePassword = true;
      emit(ValidatePasswordTrueSigUpState());
      return "❗ Password Enter The Same Password";
   */

  String? validateConfirmPassword({required String? password , required String? confirmPassword}) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      isValidateConfirmPassword = true;
      emit(ValidateConfirmPasswordTrueSigUpState());
      return "❗ Password Error";
    } else if (confirmPassword!=password) {
      isValidateConfirmPassword = false;
      emit(ValidateConfirmPasswordFalseSigUpState());
      return "PLease enter The Same Password ";
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
}
