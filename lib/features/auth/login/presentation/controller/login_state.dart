class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFaliureState extends LoginState {
  final String errorMessage;
  LoginFaliureState({required this.errorMessage});
}

class LoginLoadingState extends LoginState {}

class ToggleRememberMeState extends LoginState {}

class ForgetThePasswordMessageLoadingState extends LoginState {}

class ForgetThePasswordMessageSentSuccessfullyState extends LoginState {}

class ForgetThePasswordMessageNotSentState extends LoginState {
  final String message;
  ForgetThePasswordMessageNotSentState({required this.message});
}
