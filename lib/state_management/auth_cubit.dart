import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<User?> {
  AuthCubit(super.initialState);

  set user(User? value) => emit(value);
}
