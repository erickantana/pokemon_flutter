import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/string_extensions.dart';
import '../../../podo/stat.dart';
import '../pokemon_cubit.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stats = context.select<PokemonCubit, List<Stat?>?>((value) => value.state.pokemonDetail?.stats);
    if (stats == null || stats.isEmpty) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          "No Stats Available",
          style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final stat in stats)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      stat?.name.unhypenated.capitalized ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      stat?.baseStat?.toString() ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
