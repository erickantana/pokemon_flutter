import 'package:flutter/material.dart';

import '../../../podo/pokemon.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = pokemon.image;
    final name = pokemon.name ?? "";
    final url = pokemon.url ?? "";
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          if (image != null)
            Image.network(
              image,
              height: 128,
              errorBuilder: (context, error, stackTrace) {
                return Container(alignment: Alignment.center, height: 128, child: const Text("Unable to fetch image"));
              },
            )
          else
            Container(alignment: Alignment.center, height: 128, child: const Text("No Image Available")),
          Text(name),
        ],
      ),
    );
  }
}
