class AuthState {}

class AuthInitialState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFaliureState extends AuthState {
  final String errorMessage;
  LoginFaliureState({required this.errorMessage});
}

class LoginLoadingState extends AuthState {}

class ToggleRememberMeState extends AuthState {}

class ForgetThePasswordMessageLoadingState extends AuthState {}

class ForgetThePasswordMessageSentSuccessfullyState extends AuthState {}

class ForgetThePasswordMessageNotSentState extends AuthState {
  final String message;
  ForgetThePasswordMessageNotSentState({required this.message});
}

class SignUpInitialState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpFaliureState extends AuthState {
  final String error;
  SignUpFaliureState({required this.error});
}

class SignUpSuccessWithGoogleState extends AuthState {}

class SignUpLoadingWithGoogleState extends AuthState {}

class SignUpFaliureWithGoogleState extends AuthState {
  final String error;
  SignUpFaliureWithGoogleState({required this.error});
}

class SignUpSuccessWithFacebookState extends AuthState {}

class SignUpLoadingWithFacebookState extends AuthState {}

class SignUpFaliureWithFacebookState extends AuthState {
  final String error;
  SignUpFaliureWithFacebookState({required this.error});
}
