import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());
  String? emailAddress;
  String? password;
  String? confirmPassword;
    bool isLoading=false;

  fireBaseSignUp() async {
    emit(SignUpLoadingState());
     isLoading=true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
      isLoading=false;
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        isLoading=false;
        emit(SignUpFaliureState(
            error: "Weak password, please use a stronger password."));
      } else if (e.code == 'email-already-in-use') {
        isLoading=false;
        emit(SignUpFaliureState(
            error: "Email already in use, please try another one."));
      } else {
        isLoading=false;
        // Handle other FirebaseAuthException codes
        emit(SignUpFaliureState(error: "Authentication failed: ${e.message}"));
      }
    } catch (e) {
      isLoading=false;
      // Catch any other exceptions
      emit(SignUpFaliureState(error: "An unexpected error occurred: $e"));
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    emit(SignUpLoadingWithGoogleState());
      isLoading=true;

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
      isLoading=false;
      emit(SignUpSuccessWithGoogleState());
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      isLoading=false;
      emit(SignUpFaliureWithGoogleState(error: 'Error : ${e.code}'));

      // Handle specific FirebaseAuth exceptions if needed
    } catch (e) {
      isLoading=false;
      emit(SignUpFaliureWithGoogleState(error: 'Error : $e'));
    }

    // Return null in case of any error or exception
    return null;
  }
}
