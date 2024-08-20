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


class SignUpSuccessWithFacebookState extends SignUpState {}
class SignUpLoadingWithFacebookState extends SignUpState {}
class SignUpFaliureWithFacebookState extends SignUpState {
  final String error;
  SignUpFaliureWithFacebookState({required this.error});
}




class TogglePasswordVisibilitySignUpState extends SignUpState {}

class ToggleConfirmPasswordVisibilitySignUpState extends SignUpState {}
