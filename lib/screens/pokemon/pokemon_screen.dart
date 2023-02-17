import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../../podo/pokemon.dart';
import '../../state_management/prefs_cubit.dart';
import 'pokemons_cubit.dart';
import 'widgets/pokemon_item.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: context.read<PrefsCubit>().stream,
          builder: (context, snapshot) {
            return Row(
              children: [
                Switch(
                  value: snapshot.data?.darkMode ?? false,
                  onChanged: (bool? value) {
                    if (value != null) {
                      context.read<PrefsCubit>().setDarkMode(value);
                    }
                  },
                ),
                const Text("Use Dark Theme", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            );
          },
        ),
        BlocSelector<PokemonsCubit, PokemonsState, PokemonsState>(
          selector: (state) => state,
          builder: (context, state) {
            final firstList = state.firstList.values;
            final secondList = state.secondList.values;
            final thirdList = state.thirdList.values;
            return Expanded(
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: PokemonListView(controller: _scrollController, pokemons: firstList),
                      ),
                      Expanded(
                        child: PokemonListView(controller: _scrollController2, pokemons: secondList),
                      ),
                      Expanded(
                        child: PokemonListView(controller: _scrollController3, pokemons: thirdList),
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
              ),
            );
          },
        ),
      ],
    );
  }
}

class PokemonListView extends StatelessWidget {
  final Iterable<Pokemon> pokemons;
  final ScrollController controller;
  const PokemonListView({Key? key, required this.pokemons, required this.controller}) : super(key: key);

  static const limit = 10;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemons.length + 1,
      controller: controller,
      itemBuilder: (context, index) {
        if (index < pokemons.length) {
          return PokemonItem(pokemon: pokemons.elementAt(index));
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
    );
  }
}
