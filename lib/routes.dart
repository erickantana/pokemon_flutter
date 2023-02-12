import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'animations/slide_left_transition_page.dart';
import 'screens/login/login_screen.dart';
import 'screens/pokemon/pokemon_screen.dart';
import 'screens/register/register_screen.dart';
import 'state_management/auth_cubit.dart';
import 'state_management/pokemons_cubit.dart';

final routes = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(
      path: "/login",
      pageBuilder: (context, state) {
        return SlideLeftTransitionPage(
          child: const Scaffold(
            body: LoginScreen(),
          ),
        );
      },
      redirect: (context, state) {
        final user = context.read<AuthCubit>().state;
        if (user != null) return "/";
        return null;
      },
    ),
    GoRoute(
      path: "/register",
      pageBuilder: (context, state) {
        return SlideLeftTransitionPage(
          child: const Scaffold(
            body: RegisterScreen(),
          ),
        );
      },
    ),
    ShellRoute(
      pageBuilder: (context, state, child) {
        return SlideLeftTransitionPage(
          child: Scaffold(
            body: child,
          ),
        );
      },
      routes: [
        GoRoute(
          path: "/",
          pageBuilder: (context, state) {
            return SlideLeftTransitionPage(
              child: BlocProvider(
                create: (context) => PokemonsCubit(),
                lazy: false,
                child: const PokemonScreen(),
              ),
            );
          },
          redirect: (context, state) {
            final user = context.read<AuthCubit>().state;
            if (user == null) return "/login";

            return null;
          },
          routes: const [],
        ),
      ],
    ),
  ],
);
