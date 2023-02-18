import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../extensions/localizations.dart';
import '../../../extensions/string_extensions.dart';
import '../../../podo/encounter.dart';
import '../pokemon_cubit.dart';
import 'pokemon_encounter_dialog.dart';

class PokemonEncounters extends StatelessWidget {
  const PokemonEncounters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select<PokemonCubit, PokemonState>((value) => value.state);
    final encounters = state.pokemonDetail?.encounters;
    final dominantColor = state.paletteGenerator?.dominantColor;
    final primaryColor = dominantColor?.color;

    if (encounters == null || encounters.isEmpty) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text(
          context.locale.noEncounterAvailable,
          style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (final encounter in encounters.take(5))
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(4),
                child: InkWell(
                  onTap: () => context.push("/location-detail", extra: encounter),
                  child: Container(
                    color: primaryColor,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      encounter?.location?.name.unhypenated.capitalized ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          if (encounters.length > 5) ...[
            const Padding(padding: EdgeInsets.only(top: 8)),
            InkWell(
              onTap: () {
                showDialog<Encounter>(
                  context: context,
                  builder: (context) {
                    return PokemonEncountersDialog(
                      encounters: encounters,
                      color: primaryColor,
                    );
                  },
                ).then((encounter) {
                  Future.delayed(const Duration(milliseconds: 200), () {
                    if (encounter != null) context.push("/location-detail", extra: encounter);
                  });
                });
              },
              child: Text(
                "${context.locale.seeMore}...",
                style: const TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ]),
      ),
    );
  }
}
