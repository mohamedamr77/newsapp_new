import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure,void>>  fireBaseSignIn({
    required emailAddress,
    required password,
});
  Future<Either<Failure,void>> forgetThePassword({
    required emailAddress,
});
}