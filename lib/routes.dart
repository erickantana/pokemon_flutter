import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'animations/slide_left_transition_page.dart';
import 'podo/encounter.dart';
import 'screens/location_detail/location_detail.dart';
import 'screens/login/login_screen.dart';
import 'screens/pokemon/pokemon_cubit.dart';
import 'screens/pokemon/pokemon_screen.dart';
import 'screens/pokemon/pokemons_cubit.dart';
import 'screens/pokemon_detail/pokemon_detail_screen.dart';
import 'screens/register/register_screen.dart';
import 'state_management/auth_cubit.dart';

final routes = GoRouter(
  initialLocation: "/",
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
            body: SafeArea(child: child),
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
          routes: [
            GoRoute(
              path: "pokemon/:name",
              pageBuilder: (context, state) {
                final name = state.params["name"]!;
                return SlideLeftTransitionPage(
                  child: BlocProvider(
                    create: (context) => PokemonCubit(name),
                    child: const PokemonDetailScreen(),
                  ),
                );
              },
            ),
            GoRoute(
              path: "location-detail",
              pageBuilder: (context, state) {
                final encounter = state.extra as Encounter;
                return SlideLeftTransitionPage(
                  child: LocationDetail(
                    encounter: encounter,
                  ),
                );
              },
            )
          ],
        ),
      ],
    ),
  ],
);
