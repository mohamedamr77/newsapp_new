import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsappcode/core/failure.dart';
import 'package:newsappcode/features/auth/login/data/repo/login_repo.dart';

class LoginRepoImplement implements LoginRepo {
  @override
  Future<Either<Failure, void>> fireBaseSignIn(
      {required emailAddress, required password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(FirebaseFailure(errorMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        return left(FirebaseFailure(
            errorMessage: 'Wrong password provided for that user.'));
      } else if ((e.code == 'invalid-credential')) {
        return left(
            FirebaseFailure(errorMessage: "Please Check email and password"));
      } else {
        return left(FirebaseFailure(errorMessage: e.code));
      }
    }
  }

  @override
  Future<Either<Failure, void>> forgetThePassword({required emailAddress}) {
    // TODO: implement forgetThePassword
    throw UnimplementedError();
  }
}
/*
async {
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
 */
