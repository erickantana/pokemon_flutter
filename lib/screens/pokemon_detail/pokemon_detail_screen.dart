import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/string_extensions.dart';
import '../../podo/pokemon_type.dart';
import 'pokemon_cubit.dart';
import 'widgets/pokemon_abilities.dart';
import 'widgets/pokemon_encounters.dart';
import 'widgets/pokemon_evolutions.dart';
import 'widgets/pokemon_moves.dart';
import 'widgets/pokemon_species.dart';
import 'widgets/pokemon_stats.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({Key? key}) : super(key: key);

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  static const initialPage = 0;
  final PageController _pageController = PageController(initialPage: initialPage);
  int activePage = initialPage;
  final List<String> pages = ["Base Stats", "Encounters", "Moves", "Abilities", "Evolutions", "Species"];

  @override
  void initState() {
    super.initState();
    context.read<PokemonCubit>().fetchPokemonState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonState = context.select<PokemonCubit, PokemonState>((value) => value.state);
    final image = context.select<PokemonCubit, String?>((value) => value.image);
    final pokemonDetail = pokemonState.pokemonDetail;

    if (pokemonDetail == null) {
      return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                InkWell(onTap: () => context.pop(), child: const Icon(Icons.arrow_back)),
                const Padding(padding: EdgeInsets.only(left: 16)),
                const Text("Back", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      );
    }

    final dominantColor = pokemonState.paletteGenerator?.dominantColor;
    final primaryColor = dominantColor?.color;
    final secondaryColor = dominantColor?.titleTextColor;

    return Container(
      color: primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => context.pop(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.arrow_back, color: secondaryColor),
                ),
              ),
              Text("Back", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secondaryColor)),
              Expanded(child: Container()),
              Text("#${pokemonDetail.id}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secondaryColor)),
              const Padding(padding: EdgeInsets.only(right: 16)),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        pokemonDetail.name.capitalized,
                        style: TextStyle(color: secondaryColor, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 8)),
                    for (final type in pokemonDetail.pokemonTypes ?? <PokemonType>[])
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Text(
                          type?.name.capitalized ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                if (image != null)
                  Image.network(image)
                else
                  const Text(
                    "No Image Available",
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),
                  ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Weight", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: secondaryColor)),
                        const Padding(padding: EdgeInsets.only(top: 4)),
                        Text(
                          pokemonDetail.weight?.toString() ?? "",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secondaryColor),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Height", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: secondaryColor)),
                        const Padding(padding: EdgeInsets.only(top: 4)),
                        Text(
                          pokemonDetail.height?.toString() ?? "",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secondaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 8)),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: const [BoxShadow(color: Color.fromARGB(255, 70, 70, 70), spreadRadius: 2, blurRadius: 12)],
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0; i < pages.length; i++) ...[
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),
                                child: Text(
                                  pages[i],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: activePage == i ? Colors.blue : null,
                                  ),
                                ),
                              ),
                              onTap: () {
                                _pageController.animateToPage(i, duration: const Duration(milliseconds: 400), curve: Curves.linear).then((value) {});
                              },
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  const Divider(),
                  Expanded(
                    child: PageView(
                      onPageChanged: (value) {
                        setState(() {
                          activePage = value;
                        });
                      },
                      controller: _pageController,
                      children: const [
                        PokemonStats(),
                        PokemonEncounters(),
                        PokemonMoves(),
                        PokemonAbilities(),
                        PokemonEvolutions(),
                        PokemonSpecies(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
