import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../extensions/localizations.dart';
import '../../../extensions/string_extensions.dart';
import '../../../podo/pokemon.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonItem({Key? key, required this.pokemon}) : super(key: key);

  Future<PaletteGenerator?> generatePalette(String? image) async {
    if (image == null) return null;

    return await PaletteGenerator.fromImageProvider(NetworkImage(image));
  }

  @override
  Widget build(BuildContext context) {
    final image = pokemon.image;
    final name = pokemon.name;
    final url = pokemon.url ?? "";
    return FutureBuilder(
      future: generatePalette(image),
      builder: (context, snapshot) {
        return PokemonCard(name: name, image: image, paletteGenerator: snapshot.data, id: pokemon.id);
      },
    );
  }
}

class PokemonCard extends StatelessWidget {
  final int? id;
  final String? name;
  final String? image;
  final PaletteGenerator? paletteGenerator;
  const PokemonCard({
    Key? key,
    this.id,
    this.paletteGenerator,
    required this.name,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonImage = image;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => context.go("/pokemon/$name"),
        child: Container(
          decoration: BoxDecoration(
            color: paletteGenerator?.dominantColor?.color,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "#$id",
                  style: TextStyle(
                    color: paletteGenerator?.dominantColor?.bodyTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (pokemonImage != null)
                Image.network(
                  pokemonImage,
                  height: 92,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(alignment: Alignment.center, height: 92, child: Text(context.locale.unableToFetchImage));
                  },
                )
              else
                Container(alignment: Alignment.center, height: 92, child: Text(context.locale.noImageAvailable)),
              Text(
                name.capitalized,
                style: TextStyle(
                  color: paletteGenerator?.dominantColor?.bodyTextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
