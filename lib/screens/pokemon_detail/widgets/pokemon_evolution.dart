import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/string_extensions.dart';
import '../../../podo/pokemon_detail.dart';
import '../../../podo/sprite.dart';
import '../pokemon_evolution_cubit.dart';

class PokemonEvolution extends StatefulWidget {
  const PokemonEvolution({Key? key}) : super(key: key);

  @override
  State<PokemonEvolution> createState() => _PokemonEvolutionState();
}

class _PokemonEvolutionState extends State<PokemonEvolution> {
  @override
  void initState() {
    super.initState();
    context.read<PokemonEvolutionCubit>().fetchEvolution();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select<PokemonEvolutionCubit, EvolutionState?>((value) => value.state);

    if (state == null) return Container();

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              runSpacing: 4,
              spacing: 8,
              alignment: WrapAlignment.center,
              children: [
                for (final pokemon in state.fromPokemons ?? <PokemonDetail>[])
                  SizedBox(
                    width: 64,
                    child: Column(
                      children: [
                        PokemonSprite(sprites: pokemon.sprites),
                        Text(pokemon.name.unhypenated.capitalized, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(Icons.arrow_forward),
          ),
          Expanded(
            child: Wrap(
              runSpacing: 4,
              spacing: 8,
              alignment: WrapAlignment.center,
              children: [
                for (final pokemon in state.toPokemons ?? <PokemonDetail>[])
                  SizedBox(
                    width: 64,
                    child: Column(
                      children: [
                        PokemonSprite(sprites: pokemon.sprites),
                        Text(pokemon.name.unhypenated.capitalized, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonSprite extends StatelessWidget {
  final Sprite? sprites;
  const PokemonSprite({Key? key, this.sprites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sprites = this.sprites;
    if (sprites == null) return Container();

    final pokemonSprite = sprites.frontDefault ??
        sprites.frontFemale ??
        sprites.frontShiny ??
        sprites.frontShinyFemale ??
        sprites.backDefault ??
        sprites.backFemale ??
        sprites.backShiny ??
        sprites.backShinyFemale;

    if (pokemonSprite == null) return Container();

    return Image.network(pokemonSprite, height: 64, width: 64);
  }
}
