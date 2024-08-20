import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/validation_cubit/validation_sign_up_state.dart';


class ValidationSignUpCubit extends Cubit<ValidationSignUpState>{
  ValidationSignUpCubit() : super(ValidationSignUpInitialState());
  bool isValidateUserName = false;
  bool isValidatePassword = false;
  bool isValidateConfirmPassword = false;

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
    }  else{
      isValidateConfirmPassword = false;
      emit(ValidateConfirmPasswordFalseSigUpState());
      return null;
    }
  }

}