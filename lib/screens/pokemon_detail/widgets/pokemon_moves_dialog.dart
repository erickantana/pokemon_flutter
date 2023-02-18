import 'package:flutter/material.dart';

import '../../../extensions/localizations.dart';
import '../../../extensions/string_extensions.dart';
import '../../../podo/move.dart';

class PokemonMovesDialog extends StatelessWidget {
  final List<Move?> moves;
  final Color? color;
  const PokemonMovesDialog({Key? key, required this.moves, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          context.locale.moves,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
        ),
      ),
      content: Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final move in moves)
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: color ?? Colors.grey,
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Text(
                          move?.name.unhypenated.capitalized ?? "",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text(context.locale.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
    );
  }
}
