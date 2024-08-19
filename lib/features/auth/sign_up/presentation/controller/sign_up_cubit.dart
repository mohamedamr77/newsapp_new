import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit() : super(SignUpInitialState());
}
