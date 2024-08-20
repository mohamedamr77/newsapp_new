class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}
class SignUpLoadingState extends SignUpState {}
class SignUpFaliureState extends SignUpState {
  final String error;
  SignUpFaliureState({required this.error});
}

class SignUpSuccessWithGoogleState extends SignUpState {}
class SignUpLoadingWithGoogleState extends SignUpState {}
class SignUpFaliureWithGoogleState extends SignUpState {
  final String error;
  SignUpFaliureWithGoogleState({required this.error});
}


class ValidateUserNameTrueSigUpState extends SignUpState {}
class ValidateUserNameFalseSigUpState extends SignUpState {}

class ValidatePasswordTrueSigUpState extends SignUpState {}
class ValidatePasswordFalseSigUpState extends SignUpState {}

class ValidateConfirmPasswordTrueSigUpState extends SignUpState {}
class ValidateConfirmPasswordFalseSigUpState extends SignUpState {}

class TogglePasswordVisibilitySignUpState extends SignUpState {}

class ToggleConfirmPasswordVisibilitySignUpState extends SignUpState {}
