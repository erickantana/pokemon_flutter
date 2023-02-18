import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../extensions/localizations.dart';
import '../../../podo/species.dart';
import '../pokemon_cubit.dart';
import '../pokemon_species_variety_cubit.dart';
import 'pokemon_species_variety.dart';

class PokemonSpecies extends StatelessWidget {
  const PokemonSpecies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paletteGenerator = context.select<PokemonCubit, PaletteGenerator?>((value) => value.state.paletteGenerator);
    final species = context.select<PokemonCubit, Species?>((value) => value.state.species);

    if (species == null) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text(
          context.locale.speciesInfoUnavailable,
          style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
      );
    }

    final varieties = species.varieties;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.locale.speciesInfo,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Row(
              children: [
                Expanded(child: SpeciesInfo(stringKey: context.locale.baseHappiness, stringValue: species.baseHappiness?.toString() ?? "")),
                Expanded(child: SpeciesInfo(stringKey: context.locale.captureRate, stringValue: species.captureRate?.toString() ?? "")),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 16)),
            if (varieties != null && varieties.isNotEmpty) ...[
              Text(
                context.locale.varieties,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  for (final variety in species.varieties ?? <String>[])
                    BlocProvider(
                      create: (context) => PokemonSpeciesVarietyCubit(variety),
                      child: const PokemonSpeciesVariety(),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class SpeciesInfo extends StatelessWidget {
  final String stringKey;
  final String stringValue;
  const SpeciesInfo({Key? key, required this.stringKey, required this.stringValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(stringKey, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(stringValue),
          ],
        ),
      ),
    );
  }
}
