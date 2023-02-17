import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/string_extensions.dart';
import '../pokemon_cubit.dart';

class PokemonAbilities extends StatelessWidget {
  const PokemonAbilities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select<PokemonCubit, PokemonState>((value) => value.state);
    final abilities = state.pokemonDetail?.abilities;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (abilities != null && abilities.isNotEmpty) ...[
          const Padding(padding: EdgeInsets.only(top: 16)),
          Text(
            "Abilities",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 18,
              color: state.paletteGenerator?.dominantColor?.bodyTextColor,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 8)),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              for (final ability in abilities)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Text(ability?.name.unhypenated.capitalized ?? ""),
                ),
            ],
          ),
        ]
      ],
    );
  }
}
