import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../state_management/auth_cubit.dart';
import '../../widgets/alert_dialog/information_dialog.dart';
import '../../widgets/alert_dialog/loading_dialog.dart';
import '../../widgets/outlined_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedTextField(
            title: "Email",
            controller: emailController,
            hintText: "Email Address",
          ),
          const Padding(padding: EdgeInsets.only(top: 16)),
          OutlinedTextField(
            title: "Password",
            controller: passwordController,
            obscureText: true,
            hintText: "Password",
          ),
          const Padding(padding: EdgeInsets.only(top: 16)),
          ElevatedButton(
            onPressed: login,
            child: const Text("Sign In"),
          ),
        ],
      ),
    );
  }

  void login() {
    showDialog<DialogResult<User?>>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return LoadingDialog<User?>(
          message: "Authenticating...",
          futureAction: () async {
            try {
              final email = emailController.text;
              final password = passwordController.text;
              final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
              return DialogResult(isSuccess: true, message: "Authenticated", futureResult: userCredential.user);
            } catch (error) {
              if (error is FirebaseAuthException) {
                if (error.code == 'user-not-found') {
                  return DialogResult(isSuccess: false, message: "No user found for that email.");
                } else if (error.code == 'wrong-password') {
                  return DialogResult(isSuccess: false, message: "Wrong password provided for that user.");
                }
              }
              return DialogResult(isSuccess: false, message: "Unable to authenticate");
            }
          },
        );
      },
    ).then((dialogResult) {
      if (dialogResult == null) return;

      if (dialogResult.isSuccess && dialogResult.futureResult != null) {
        context.read<AuthCubit>().user = dialogResult.futureResult;
        context.go("/");
      } else {
        showDialog(
          context: context,
          builder: (context) => InformationDialog(title: "Authentication Status", message: dialogResult.message),
        );
      }
    });
  }
}
