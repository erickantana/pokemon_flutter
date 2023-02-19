import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pokemons_cubit.dart';
import 'widgets/pokemon_item.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  static const limit = 20;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select<PokemonsCubit, PokemonsState>((value) => value.state);
    final pokemons = state.pokemons.values;
    final count = state.count;
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
      ),
      controller: _scrollController,
      itemCount: min(pokemons.length + 1, count ?? pokemons.length + 1),
      itemBuilder: (context, index) {
        if (index < pokemons.length) {
          return PokemonItem(pokemon: pokemons.elementAt(index));
        } else {
          context.read<PokemonsCubit>().fetchPokemon(limit);
          return Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16),
              child: const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
