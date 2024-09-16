import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsappcode/features/auth/sign_up/data/sign_up_repo.dart';

import '../../../../core/failure.dart';

class SignUpImplementation implements SignUpRepo {
  @override
  fireBaseSignUp() {
    // TODO: implement fireBaseSignUp
    throw UnimplementedError();
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