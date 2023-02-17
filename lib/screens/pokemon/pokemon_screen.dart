import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'pokemons_cubit.dart';
import 'widgets/pokemon_item.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  static const limit = 10;

  final LinkedScrollControllerGroup _linkedScrollControllerGroup = LinkedScrollControllerGroup();
  late ScrollController _scrollController;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;

  @override
  void initState() {
    super.initState();
    _scrollController = _linkedScrollControllerGroup.addAndGet();
    _scrollController2 = _linkedScrollControllerGroup.addAndGet();
    _scrollController3 = _linkedScrollControllerGroup.addAndGet();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select<PokemonsCubit, PokemonsState>((value) => value.state);
    final firstList = state.firstList.values;
    final secondList = state.secondList.values;
    final thirdList = state.thirdList.values;
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index < firstList.length) {
                    return PokemonItem(pokemon: firstList.elementAt(index));
                  } else {
                    context.read<PokemonsCubit>().fetchPokemon(limit);
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      child: Container(),
                    );
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController2,
                itemBuilder: (context, index) {
                  if (index < secondList.length) {
                    return PokemonItem(pokemon: secondList.elementAt(index));
                  } else {
                    context.read<PokemonsCubit>().fetchPokemon(limit);
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      child: Container(),
                    );
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController3,
                itemBuilder: (context, index) {
                  if (index < thirdList.length) {
                    return PokemonItem(pokemon: thirdList.elementAt(index));
                  } else {
                    context.read<PokemonsCubit>().fetchPokemon(limit);
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      child: Container(),
                    );
                  }
                },
              ),
            ),
          ],
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

class Tile extends StatelessWidget {
  final String text;
  const Tile({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, left: 4, right: 4),
      height: 128,
      color: Colors.grey,
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}
