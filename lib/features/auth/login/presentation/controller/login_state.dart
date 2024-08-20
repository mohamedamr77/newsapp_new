class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFaliureState extends LoginState {
  final String errorMessage;
  LoginFaliureState({required this.errorMessage});
}

class LoginLoadingState extends LoginState {}

class ToggleRememberMeState extends LoginState {}
