class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFaliureState extends LoginState {
  final String errorMessage;
  LoginFaliureState({required this.errorMessage});
}

class LoginLoadingState extends LoginState {}

class ValidationNameTrueState extends LoginState {}

class ValidationNameFalseState extends LoginState {}

class ValidationPasswordTrueState extends LoginState {}

class ValidationPasswordFalseState extends LoginState {}

class TogglePasswordVisibilityState extends LoginState {}

class ToggleRememberMeState extends LoginState {}
