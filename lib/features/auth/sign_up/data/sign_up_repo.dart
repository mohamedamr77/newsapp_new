import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failure.dart';

abstract class SignUpRepo{
  fireBaseSignUp();
  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
