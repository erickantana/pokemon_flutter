import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/string_extensions.dart';
import '../pokemon_cubit.dart';
import 'pokemon_moves_dialog.dart';

class PokemonMoves extends StatelessWidget {
  const PokemonMoves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select<PokemonCubit, PokemonState>((value) => value.state);
    final moves = state.pokemonDetail?.moves;

    if (moves == null || moves.isEmpty) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          "No Moves Available",
          style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        color: state.paletteGenerator?.dominantColor?.color,
                      );
                    },
                  );
                },
                child: Text(
                  "See more...",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: state.paletteGenerator?.dominantColor?.bodyTextColor,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
