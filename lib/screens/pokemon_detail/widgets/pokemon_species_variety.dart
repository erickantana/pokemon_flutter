import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/string_extensions.dart';
import '../../../podo/pokemon_detail.dart';
import '../pokemon_species_variety_cubit.dart';

class PokemonSpeciesVariety extends StatelessWidget {
  const PokemonSpeciesVariety({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonDetail = context.select<PokemonSpeciesVarietyCubit, PokemonDetail?>((value) => value.state);
    if (pokemonDetail == null) return Container();

    final image = context.read<PokemonSpeciesVarietyCubit>().image;

    return Column(
      children: [
        if (image != null) Image.network(image),
        Text(pokemonDetail.name.unhypenated.capitalized),
      ],
    );
  }
}
