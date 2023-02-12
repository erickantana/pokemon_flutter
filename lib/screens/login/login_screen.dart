import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/localizations.dart';
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
  final emailController = TextEditingController(text: "test1@gmail.com");
  final passwordController = TextEditingController(text: "123456");

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
            title: context.locale.email,
            controller: emailController,
            hintText: context.locale.emailAddress,
          ),
          const Padding(padding: EdgeInsets.only(top: 16)),
          OutlinedTextField(
            title: context.locale.password,
            controller: passwordController,
            obscureText: true,
            hintText: context.locale.password,
          ),
          const Padding(padding: EdgeInsets.only(top: 16)),
          InkWell(
            onTap: () => context.push("/register"),
            child: Text(context.locale.register, style: const TextStyle(color: Colors.blue)),
          ),
          ElevatedButton(
            onPressed: login,
            child: Text(context.locale.signIn),
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
          message: "${context.locale.authenticating}...",
          futureAction: () async {
            try {
              final email = emailController.text;
              final password = passwordController.text;

              if (email.isEmpty) return DialogResult.failed(message: context.locale.emptyField("Email"));
              if (password.isEmpty) return DialogResult.failed(message: context.locale.emptyField("Password"));

              final user = await context.read<AuthCubit>().login(email, password);
              return DialogResult.success(futureResult: user);
            } catch (error) {
              if (error is FirebaseAuthException) {
                if (error.code == 'user-not-found') {
                  return DialogResult.failed(message: context.locale.userNotFound);
                } else if (error.code == 'wrong-password') {
                  return DialogResult.failed(message: context.locale.wrongPassword);
                } else {
                  return DialogResult.failed(message: "Firebase Auth Failure: $error");
                }
              }
              return DialogResult.failed(message: context.locale.authenticationFailure);
            }
          },
        );
      },
    ).then((dialogResult) {
      if (dialogResult == null) return;

      if (dialogResult.isSuccess && dialogResult.futureResult != null) {
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
