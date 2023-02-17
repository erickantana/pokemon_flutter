import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../podo/species.dart';
import '../pokemon_cubit.dart';

class PokemonSpecies extends StatelessWidget {
  const PokemonSpecies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paletteGenerator = context.select<PokemonCubit, PaletteGenerator?>((value) => value.state.paletteGenerator);
    final species = context.select<PokemonCubit, Species?>((value) => value.state.species);

    if (species == null) return Container();

    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 16)),
        Text(
          "Species",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontStyle: FontStyle.italic,
            color: paletteGenerator?.dominantColor?.bodyTextColor,
          ),
        ),
      ],
    );
  }
}
