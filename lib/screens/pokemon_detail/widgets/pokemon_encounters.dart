import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (encounters != null && encounters.isNotEmpty) ...[
          const Padding(padding: EdgeInsets.only(top: 16)),
          Text(
            "Location Encounters",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: state.paletteGenerator?.dominantColor?.bodyTextColor,
            ),
          ),
          for (final encounter in encounters.take(5))
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(4),
                child: InkWell(
                  onTap: () => context.push("/location-detail", extra: encounter),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: Text(encounter?.location?.name.unhypenated.capitalized ?? ""),
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
                      color: state.paletteGenerator?.dominantColor?.color,
                    );
                  },
                ).then((encounter) {
                  Future.delayed(const Duration(milliseconds: 200), () {
                    if (encounter != null) context.push("/location-detail", extra: encounter);
                  });
                });
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
        ]
      ],
    );
  }
}
