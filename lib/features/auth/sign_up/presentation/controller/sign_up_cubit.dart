import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  fireBaseSignUp() async {
    emit(SignUpLoadingState());

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFaliureState(error: "Weak password, please use a stronger password."));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFaliureState(error: "Email already in use, please try another one."));
      } else {
        // Handle other FirebaseAuthException codes
        emit(SignUpFaliureState(error: "Authentication failed: ${e.message}"));
      }
    } catch (e) {
      // Catch any other exceptions
      emit(SignUpFaliureState(error: "An unexpected error occurred: $e"));
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}
