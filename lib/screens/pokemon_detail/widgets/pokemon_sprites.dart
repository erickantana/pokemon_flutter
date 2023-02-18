import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../podo/sprite.dart';
import '../pokemon_cubit.dart';

class PokemonSprites extends StatefulWidget {
  const PokemonSprites({Key? key}) : super(key: key);

  @override
  State<PokemonSprites> createState() => _PokemonSpritesState();
}

class _PokemonSpritesState extends State<PokemonSprites> with TickerProviderStateMixin {
  static const initialPage = 0;
  final PageController _pageController = PageController(initialPage: initialPage);
  int activePage = initialPage;

  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  )..repeat(reverse: true);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sprites = context.select<PokemonCubit, Sprite?>((value) => value.state.pokemonDetail?.sprites);
    if (sprites == null) return Container();

    String? backDefault = sprites.backDefault;
    String? backFemale = sprites.backFemale;
    String? backShiny = sprites.backShiny;
    String? backShinyFemale = sprites.backShinyFemale;
    String? frontDefault = sprites.frontDefault;
    String? frontFemale = sprites.frontFemale;
    String? frontShiny = sprites.frontShiny;
    String? frontShinyFemale = sprites.frontShinyFemale;
    final existingSprites = [
      if (frontDefault != null) frontDefault,
      if (backDefault != null) backDefault,
      if (frontShiny != null) frontShiny,
      if (backShiny != null) backShiny,
      if (frontFemale != null) frontFemale,
      if (backFemale != null) backFemale,
      if (frontShinyFemale != null) frontShinyFemale,
      if (backShinyFemale != null) backShinyFemale,
    ];
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      height: 128,
      child: Row(
        children: [
          InkWell(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () {
              _pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.linear);
            },
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                for (final sprite in existingSprites) PokemonAnimatedSprite(src: sprite, controller: animationController),
              ],
            ),
          ),
          InkWell(
            child: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.linear);
            },
          ),
        ],
      ),
    );
  }
}

class PokemonAnimatedSprite extends AnimatedWidget {
  final String src;
  const PokemonAnimatedSprite({
    super.key,
    required AnimationController controller,
    required this.src,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, _progress.value * -6),
      child: Image.network(src, height: 128),
    );
  }
}
