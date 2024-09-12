import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsappcode/features/auth/view_mdoel/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  bool remember = false;
  String? emailAddress;
  String? password;
  bool isLoading = false;
  String? confirmPassword;

  fireBaseSignIn() async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFaliureState(errorMessage: e.code));
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        emit(LoginFaliureState(errorMessage: e.code));
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      } else if ((e.code == 'invalid-credential')) {
        emit(
            LoginFaliureState(errorMessage: "Please Check email and password"));
      } else {
        emit(LoginFaliureState(errorMessage: e.code));
      }
    }
  }

  toggleRememberMeValue({required bool remember}) {
    this.remember = remember;
    emit(ToggleRememberMeState());
  }

  forgetThePassword({required BuildContext context}) async {
    emit(ForgetThePasswordMessageLoadingState());
    try {
      final email = emailAddress;
      if (email == null || email.isEmpty) {
        // Emit a state indicating that the email was not provided
        emit(ForgetThePasswordMessageNotSentState(
            message: 'Please provide your email address.'));
        return;
      }

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // Emit a state indicating success
      emit(ForgetThePasswordMessageSentSuccessfullyState());
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'No user found with this email address.';
      } else {
        errorMessage = 'An error occurred. Please try again.';
      }

      // Emit a state indicating failure with the error message
      emit(ForgetThePasswordMessageNotSentState(message: errorMessage));
    } catch (e) {
      // Handle any other errors and emit a failure state
      emit(ForgetThePasswordMessageNotSentState(
          message: 'An unexpected error occurred. Please try again.'));
    }
  }

  fireBaseSignUp() async {
    emit(SignUpLoadingState());
    isLoading = true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
      isLoading = false;
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        isLoading = false;
        emit(SignUpFaliureState(
            error: "Weak password, please use a stronger password."));
      } else if (e.code == 'email-already-in-use') {
        isLoading = false;
        emit(SignUpFaliureState(
            error: "Email already in use, please try another one."));
      } else {
        isLoading = false;
        // Handle other FirebaseAuthException codes
        emit(SignUpFaliureState(error: "Authentication failed: ${e.message}"));
      }
    } catch (e) {
      isLoading = false;
      // Catch any other exceptions
      emit(SignUpFaliureState(error: "An unexpected error occurred: $e"));
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    emit(SignUpLoadingWithGoogleState());
    isLoading = true;

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If the user cancels the sign-in process
      if (googleUser == null) {
        emit(SignUpFaliureWithGoogleState(error: 'Please complete the SignUp'));
        // print("Sign-in process was canceled by the user.");
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      isLoading = false;
      emit(SignUpSuccessWithGoogleState());
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      emit(SignUpFaliureWithGoogleState(error: 'Error : ${e.code}'));

      // Handle specific FirebaseAuth exceptions if needed
    } catch (e) {
      isLoading = false;
      emit(SignUpFaliureWithGoogleState(error: 'Error : $e'));
    }

    // Return null in case of any error or exception
    return null;
  }
}
