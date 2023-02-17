import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../podo/sprite.dart';
import '../pokemon_cubit.dart';

class PokemonSprites extends StatelessWidget {
  const PokemonSprites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sprites = context.select<PokemonCubit, Sprite?>((value) => value.state.pokemonDetail?.sprites);
    final paletteGenerator = context.select<PokemonCubit, PaletteGenerator?>((value) => value.state.paletteGenerator);
    if (sprites == null) return Container();

    String? backDefault = sprites.backDefault;
    String? backFemale = sprites.backFemale;
    String? backShiny = sprites.backShiny;
    String? backShinyFemale = sprites.backShinyFemale;
    String? frontDefault = sprites.frontDefault;
    String? frontFemale = sprites.frontFemale;
    String? frontShiny = sprites.frontShiny;
    String? frontShinyFemale = sprites.frontShinyFemale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 16)),
        Text(
          "Sprites",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic, color: paletteGenerator?.dominantColor?.bodyTextColor),
        ),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                if (backDefault != null) Image.network(backDefault, height: 92),
                if (backFemale != null) Image.network(backFemale, height: 92),
                if (backShiny != null) Image.network(backShiny, height: 92),
                if (backShinyFemale != null) Image.network(backShinyFemale, height: 92),
                if (frontDefault != null) Image.network(frontDefault, height: 92),
                if (frontFemale != null) Image.network(frontFemale, height: 92),
                if (frontShiny != null) Image.network(frontShiny, height: 92),
                if (frontShinyFemale != null) Image.network(frontShinyFemale, height: 92),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
