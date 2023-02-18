import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './routes.dart';
import 'firebase_options.dart';
import 'podo/ability.dart';
import 'podo/encounter.dart';
import 'podo/encounter_detail.dart';
import 'podo/encounter_version.dart';
import 'podo/evolution_chain.dart';
import 'podo/evolution_detail.dart';
import 'podo/location.dart';
import 'podo/move.dart';
import 'podo/pokemon.dart';
import 'podo/pokemon_detail.dart';
import 'podo/pokemon_type.dart';
import 'podo/species.dart';
import 'podo/sprite.dart';
import 'podo/stat.dart';
import 'state_management/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initHiveForFlutter();
  Hive.initFlutter();
  Hive.registerAdapter(AbilityAdapter());
  Hive.registerAdapter(EncounterDetailAdapter());
  Hive.registerAdapter(EncounterVersionAdapter());
  Hive.registerAdapter(EncounterAdapter());
  Hive.registerAdapter(EvolutionChainAdapter());
  Hive.registerAdapter(LocationAdapter());
  Hive.registerAdapter(MoveAdapter());
  Hive.registerAdapter(PokemonDetailAdapter());
  Hive.registerAdapter(PokemonAdapter());
  Hive.registerAdapter(SpriteAdapter());
  Hive.registerAdapter(StatAdapter());
  Hive.registerAdapter(PokemonTypeAdapter());
  Hive.registerAdapter(EvolutionDetailAdapter());
  Hive.registerAdapter(SpeciesAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocProvider(
            create: (context) {
              final user = FirebaseAuth.instance.currentUser;
              return AuthCubit(user);
            },
            child: MaterialApp.router(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: routes,
              themeMode: ThemeMode.system,
              darkTheme: ThemeData.dark(useMaterial3: true),
              theme: ThemeData.light(useMaterial3: true),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
