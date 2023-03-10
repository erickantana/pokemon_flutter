import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/localizations.dart';
import '../../../extensions/string_extensions.dart';
import '../pokemon_cubit.dart';

class PokemonAbilities extends StatelessWidget {
  const PokemonAbilities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select<PokemonCubit, PokemonState>((value) => value.state);
    final abilities = state.pokemonDetail?.abilities;
    final dominantColor = state.paletteGenerator?.dominantColor;
    final primaryColor = dominantColor?.color;

    if (abilities == null || abilities.isEmpty) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text(
          context.locale.noAbilitiesAvailable,
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
              runSpacing: 8,
              spacing: 8,
              children: [
                for (final ability in abilities)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Text(
                      ability?.name.unhypenated.capitalized ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
