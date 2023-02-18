import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../extensions/localizations.dart';
import '../../../extensions/string_extensions.dart';
import '../../../podo/encounter.dart';

class PokemonEncountersDialog extends StatelessWidget {
  final List<Encounter?> encounters;
  final Color? color;
  const PokemonEncountersDialog({Key? key, required this.encounters, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          context.locale.encounter,
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
                for (final encounter in encounters)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Material(
                      color: color,
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(4),
                      child: InkWell(
                        onTap: () => context.pop(encounter),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  encounter?.location?.name.unhypenated.capitalized ?? "",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 8)),
                            const Icon(Icons.arrow_forward, color: Colors.white),
                            const Padding(padding: EdgeInsets.only(left: 8)),
                          ],
                        ),
                      ),
                    ),
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
