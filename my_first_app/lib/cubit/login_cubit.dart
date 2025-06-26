import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginState(email: '', password: ''));

  void updateEmail(String email){
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password){
    emit(state.copyWith(password: password));
  }
}