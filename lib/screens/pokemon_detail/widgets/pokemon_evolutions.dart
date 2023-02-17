import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pokemon_cubit.dart';
import '../pokemon_evolution_cubit.dart';
import 'pokemon_evolution.dart';

class PokemonEvolutions extends StatelessWidget {
  const PokemonEvolutions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final evolutionChains = context.select<PokemonCubit, List<EvolutionMap>>((value) => value.evolutionChains);

    if (evolutionChains.isEmpty) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          "No Evolutions Available",
          style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
      );
    }

    return Column(
      children: [
        if (evolutionChains.isNotEmpty) ...[
          for (final evolutionChain in evolutionChains)
            BlocProvider(
              create: (context) => PokemonEvolutionCubit(evolutionChain),
              child: const PokemonEvolution(),
            ),
        ],
      ],
    );
  }
}
