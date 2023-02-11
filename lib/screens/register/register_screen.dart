import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/localizations.dart';
import '../../state_management/auth_cubit.dart';
import '../../widgets/alert_dialog/information_dialog.dart';
import '../../widgets/alert_dialog/loading_dialog.dart';
import '../../widgets/outlined_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(32),
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
          ElevatedButton(
            onPressed: register,
            child: Text(context.locale.register),
          ),
        ],
      ),
    );
  }

  void register() {
    showDialog<DialogResult<User?>>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return LoadingDialog<User?>(
          message: "${context.locale.registering}...",
          futureAction: () async {
            try {
              final email = emailController.text;
              final password = passwordController.text;

              if (email.isEmpty) return DialogResult.failed(message: context.locale.emptyField("Email"));
              if (password.isEmpty) return DialogResult.failed(message: context.locale.emptyField("Password"));

              final user = await context.read<AuthCubit>().register(email, password);
              return DialogResult.success(futureResult: user);
            } catch (error) {
              if (error is FirebaseAuthException) {
                if (error.code == 'weak-password') {
                  return DialogResult.failed(message: context.locale.weakPassword);
                } else if (error.code == 'email-already-in-use') {
                  return DialogResult.failed(message: context.locale.emailAlreadyInUse);
                }
              }
              return DialogResult.failed(message: context.locale.registrationFailure);
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
