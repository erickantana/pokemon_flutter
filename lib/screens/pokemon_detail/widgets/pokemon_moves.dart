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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (moves != null && moves.isNotEmpty) ...[
          const Padding(padding: EdgeInsets.only(top: 16)),
          Text(
            "Moves",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 18, color: state.paletteGenerator?.dominantColor?.bodyTextColor),
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
      ],
    );
  }
}
