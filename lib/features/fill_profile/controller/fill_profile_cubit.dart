import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/fill_profile/controller/fill_profile_state.dart';

class FillProfileCubit extends Cubit<FillProfileState>{
  FillProfileCubit() : super(FillProfileInitialState());

}