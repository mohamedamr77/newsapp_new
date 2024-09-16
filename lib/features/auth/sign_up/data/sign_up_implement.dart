import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsappcode/features/auth/sign_up/data/sign_up_repo.dart';

import '../../../../core/failure.dart';

class SignUpImplementation implements SignUpRepo {
  @override
  Future<Either<Failure,void>>  fireBaseSignUp({required String? emailAddress, required String? password}) async {
    try {final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
    return right(null);
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return  left(FirebaseFailure(message: "Weak password, please use a stronger password."));
      }
      else if (e.code == 'email-already-in-use') {
      return  left(FirebaseFailure(message:  "Email already in use, please try another one."));
      }
      else {
       return left(FirebaseFailure(message: "Authentication failed: ${e.message} "));
      }
    } catch (e) {
      return left(FirebaseFailure(message: "An unexpected error occurred: $e"));
    }

  }

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If the user cancels the sign-in process
      if (googleUser == null) {
        // print("Sign-in process was canceled by the user.");
        return Left(ServerFaliure( message: 'Sign-in process was canceled by the user.'));
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      UserCredential user= await FirebaseAuth.instance.signInWithCredential(credential);
       return Right(user);
    } catch (e) {
       return Left(ServerFaliure(message: "Error $e"));
    }

  }



}