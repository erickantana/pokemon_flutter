import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/string_extensions.dart';
import '../../podo/encounter.dart';
import '../../podo/pokemon_type.dart';
import '../../widgets/key_value_pair.dart';
import '../pokemon/pokemon_cubit.dart';
import 'widgets/pokemon_encounter_dialog.dart';
import 'widgets/pokemon_moves_dialog.dart';
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
    final pokemonDetail = pokemonState.pokemonDetail;

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

    final pokemonSprite = pokemonDetail.sprites?.frontDefault ??
        pokemonDetail.sprites?.backDefault ??
        pokemonDetail.sprites?.backFemale ??
        pokemonDetail.sprites?.backShiny ??
        pokemonDetail.sprites?.backShinyFemale ??
        pokemonDetail.sprites?.frontDefault ??
        pokemonDetail.sprites?.frontFemale ??
        pokemonDetail.sprites?.frontShiny ??
        pokemonDetail.sprites?.frontShinyFemale;
    final stats = pokemonDetail.stats;
    final encounters = pokemonDetail.encounters;
    final moves = pokemonDetail.moves;
    final abilities = pokemonDetail.abilities;
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
                            pokemonDetail.name.capitalized,
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
                        if (pokemonSprite != null)
                          Container(
                            height: 128,
                            width: 128,
                            clipBehavior: Clip.hardEdge,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(64)),
                              color: Colors.white,
                            ),
                            child: Image.network(pokemonSprite),
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
                    if (encounters != null && encounters.isNotEmpty) ...[
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        "Location Encounters",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: pokemonState.paletteGenerator?.dominantColor?.bodyTextColor,
                        ),
                      ),
                      for (final encounter in encounters.take(5))
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Material(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(4),
                            child: InkWell(
                              onTap: () => context.push("/location-detail", extra: encounter),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                child: Text(encounter?.location?.name.unhypenated.capitalized ?? ""),
                              ),
                            ),
                          ),
                        ),
                      if (encounters.length > 5) ...[
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        InkWell(
                          onTap: () {
                            showDialog<Encounter>(
                              context: context,
                              builder: (context) {
                                return PokemonEncountersDialog(
                                  encounters: encounters,
                                  color: pokemonState.paletteGenerator?.dominantColor?.color,
                                );
                              },
                            ).then((encounter) {
                              Future.delayed(const Duration(milliseconds: 200), () {
                                if (encounter != null && mounted) context.push("/location-detail", extra: encounter);
                              });
                            });
                          },
                          child: Text(
                            "See more...",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: pokemonState.paletteGenerator?.dominantColor?.bodyTextColor,
                            ),
                          ),
                        ),
                      ],
                    ],
                    if (moves != null && moves.isNotEmpty) ...[
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        "Moves",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            color: pokemonState.paletteGenerator?.dominantColor?.bodyTextColor),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final move in moves.take(10))
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Text(move?.name.unhypenated.capitalized ?? ""),
                            ),
                        ],
                      ),
                      if (moves.length > 10) ...[
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return PokemonMovesDialog(
                                  moves: moves,
                                  color: pokemonState.paletteGenerator?.dominantColor?.color,
                                );
                              },
                            );
                          },
                          child: Text(
                            "See more...",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: pokemonState.paletteGenerator?.dominantColor?.bodyTextColor,
                            ),
                          ),
                        ),
                      ],
                    ],
                    if (abilities != null && abilities.isNotEmpty) ...[
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        "Abilities",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: pokemonState.paletteGenerator?.dominantColor?.bodyTextColor,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        children: [
                          for (final ability in abilities)
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Text(ability?.name.unhypenated.capitalized ?? ""),
                            ),
                        ],
                      )
                    ],
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
