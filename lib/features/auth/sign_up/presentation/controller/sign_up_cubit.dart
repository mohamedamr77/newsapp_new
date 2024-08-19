import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit() : super(SignUpInitialState());
  bool isValidateUserName = false;
  bool isValidatePassword = false;
  bool isValidateConfirmPassword = false;

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
       isValidateUserName = true;
       emit(ValidateUserNameTrueSigUp());
      debugPrint("$isValidateUserName");
      return "❗ Invalid Username";
    } else {
      isValidateUserName = false;
      emit(ValidateUserNameFalseSigUp());
      debugPrint("$isValidateUserName");
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      isValidatePassword = true;
      emit(ValidatePasswordTrueSigUp());
      return "❗ Password Error";
    } else {
      isValidatePassword = false;
      emit(ValidatePasswordFalseSigUp());
      return null;
    }
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      isValidatePassword = true;
      emit(ValidateConfirmPasswordTrueSigUp());
      return "❗ Password Error";
    } else {
      isValidatePassword = false;
      emit(ValidateConfirmPasswordFalseSigUp());
      return null;
    }
  }

}
