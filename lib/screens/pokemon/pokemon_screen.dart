import 'dart:developer' as dev;
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
  static const limit = 10;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select<PokemonsCubit, PokemonsState>((value) => value.state);
    final pokemons = state.pokemons.values;
    final count = state.count;
    dev.log("Pokemon@listViewItemCountParam: ${min(pokemons.length + 1, count ?? pokemons.length + 1)}");
    dev.log("Pokemon@count: $count");
    dev.log("Pokemon@count: ${pokemons.length + 1}");
    return Stack(
      children: [
        GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.9,
          ),
          controller: _scrollController,
          itemCount: min(pokemons.length + 1, count ?? pokemons.length + 1),
          itemBuilder: (context, index) {
            if (index < pokemons.length) {
              return PokemonItem(pokemon: pokemons.elementAt(index));
            } else {
              context.read<PokemonsCubit>().fetchPokemon(limit: limit, offset: pokemons.length);
              return Container(
                alignment: Alignment.center,
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: const CircularProgressIndicator(),
              );
            }
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                );
              },
              child: const Icon(Icons.arrow_downward),
            ),
          ),
        ),
      ],
    );
  }
}
