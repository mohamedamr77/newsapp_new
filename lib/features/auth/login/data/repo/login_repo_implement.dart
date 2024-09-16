import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsappcode/core/failure.dart';
import 'package:newsappcode/features/auth/login/data/repo/login_repo.dart';

class LoginRepoImplement implements LoginRepo{
  @override
  Future<Either<Failure, UserCredential>> fireBaseSignIn({required emailAddress, required password}) {
    // TODO: implement fireBaseSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> forgetThePassword({required emailAddress}) {
    // TODO: implement forgetThePassword
    throw UnimplementedError();
  }
}
