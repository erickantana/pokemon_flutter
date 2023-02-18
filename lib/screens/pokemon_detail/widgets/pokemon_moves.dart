import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/localizations.dart';
import '../../../extensions/string_extensions.dart';
import '../pokemon_cubit.dart';
import 'pokemon_moves_dialog.dart';

class PokemonMoves extends StatelessWidget {
  const PokemonMoves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select<PokemonCubit, PokemonState>((value) => value.state);
    final moves = state.pokemonDetail?.moves;
    final dominantColor = state.paletteGenerator?.dominantColor;
    final primaryColor = dominantColor?.color;

    if (moves == null || moves.isEmpty) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text(
          context.locale.noMoveAvailable,
          style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
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
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Text(
                      move?.name.unhypenated.capitalized ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
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
                  "${context.locale.seeMore}...",
                  style: const TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
