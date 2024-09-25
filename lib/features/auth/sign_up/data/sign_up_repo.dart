import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failure.dart';

abstract class SignUpRepo {
  Future<Either<Failure, void>> fireBaseSignUp(
      {required String? emailAddress, required String? password});
  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
