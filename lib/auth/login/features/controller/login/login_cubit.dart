import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/auth/login/features/controller/login/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitialState());
  void isValidate=false;

}