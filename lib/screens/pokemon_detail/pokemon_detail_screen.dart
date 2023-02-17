import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/string_extensions.dart';
import '../../podo/pokemon_type.dart';
import '../../widgets/key_value_pair.dart';
import 'pokemon_cubit.dart';
import 'pokemon_evolution_cubit.dart';
import 'widgets/pokemon_abilities.dart';
import 'widgets/pokemon_encounters.dart';
import 'widgets/pokemon_evolution.dart';
import 'widgets/pokemon_moves.dart';
import 'widgets/pokemon_species.dart';
import 'widgets/pokemon_sprites.dart';
import 'widgets/pokemon_stats.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({Key? key}) : super(key: key);

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PokemonCubit>().fetchPokemonState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonState = context.select<PokemonCubit, PokemonState>((value) => value.state);
    final image = context.select<PokemonCubit, String?>((value) => value.image);
    final pokemonDetail = pokemonState.pokemonDetail;
    final evolutionChains = context.select<PokemonCubit, List<EvolutionMap>>((value) => value.evolutionChains);

    context.read<PokemonCubit>().evolutionChains;
    if (pokemonDetail == null) {
      return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.arrow_back),
                ),
                const Padding(padding: EdgeInsets.only(left: 16)),
                const Text(
                  "Back",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );
    }

    final stats = pokemonDetail.stats;
    return Container(
      color: pokemonState.paletteGenerator?.dominantColor?.color ?? Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => context.pop(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    Icons.arrow_back,
                    color: pokemonState.paletteGenerator?.dominantColor?.bodyTextColor,
                  ),
                ),
              ),
              Text(
                "Back",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: pokemonState.paletteGenerator?.dominantColor?.bodyTextColor,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${pokemonDetail.name.capitalized} #${pokemonDetail.id}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 8)),
                        for (final type in pokemonDetail.pokemonTypes ?? <PokemonType>[])
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Text(
                              type?.name.capitalized ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: pokemonState.paletteGenerator?.dominantColor?.color,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16)),
                    Row(
                      children: [
                        if (stats != null)
                          Expanded(
                            flex: 1,
                            child: PokemonStat(stats: stats, color: pokemonState.paletteGenerator?.dominantColor?.bodyTextColor),
                          )
                        else
                          const Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                "No Stats Available",
                                style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),
                              ),
                            ),
                          ),
                        const Padding(padding: EdgeInsets.only(left: 32)),
                        if (image != null)
                          Container(
                            height: 128,
                            width: 128,
                            clipBehavior: Clip.hardEdge,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(64)),
                              color: Colors.white,
                            ),
                            child: Image.network(image),
                          )
                        else
                          Container(
                            width: 128,
                            height: 128,
                            alignment: Alignment.center,
                            child: const Text(
                              "No Image Available",
                              style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: KeyValuePair(stringKey: "Weight", stringValue: pokemonDetail.weight?.toString()),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: KeyValuePair(stringKey: "Height", stringValue: pokemonDetail.height?.toString()),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const PokemonSprites(),
                    const PokemonEncounters(),
                    const PokemonMoves(),
                    const PokemonAbilities(),
                    if (evolutionChains.isNotEmpty) ...[
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        "Evolutions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: pokemonState.paletteGenerator?.dominantColor?.bodyTextColor,
                        ),
                      ),
                      for (final evolutionChain in evolutionChains)
                        BlocProvider(
                          create: (context) => PokemonEvolutionCubit(evolutionChain),
                          child: const PokemonEvolution(),
                        ),
                    ],
                    const PokemonSpecies(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
