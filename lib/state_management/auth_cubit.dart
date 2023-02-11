import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<User?> {
  AuthCubit(super.initialState);

  Future<User?> login(String email, String password) async {
    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    emit(user);
    return user;
  }

  Future<User?> register(String email, String password) async {
    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    emit(user);
    return user;
  }
}
