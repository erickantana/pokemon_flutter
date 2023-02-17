import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../data_sources/data_source.dart';
import '../../podo/evolution_chain.dart';
import '../../podo/evolution_detail.dart';
import '../../podo/pokemon_detail.dart';
import '../../podo/species.dart';
import '../../repositories/evolution_chain_repository.dart';
import '../../repositories/pokemon_detail_repository.dart';
import '../../repositories/species_repository.dart';

class PokemonState {
  PokemonDetail? pokemonDetail;
  PaletteGenerator? paletteGenerator;
  Species? species;
  EvolutionChain? evolutionChain;

  PokemonState({this.pokemonDetail, this.evolutionChain, this.paletteGenerator, this.species});
}

class EvolutionMap {
  String? fromSpeciesUrl;
  String? toSpeciesUrl;
  List<EvolutionDetail?>? evolutionDetail;

  @override
  String toString() {
    return {
      "fromSpeciesUrl": fromSpeciesUrl,
      "toSpeciesUrl": toSpeciesUrl,
      "evolutionDetail": evolutionDetail,
    }.toString();
  }
}

class PokemonCubit extends Cubit<PokemonState> {
  final String name;

  PokemonCubit(this.name) : super(PokemonState());

  Future<void> fetchPokemonState({bool skipNetwork = false}) async {
    if (!skipNetwork) {
      DataSource.fetchPokemonDetail(name).then((pokemonDetail) async {
        if (pokemonDetail == null) return;

        await PokemonDetailRepository.setPokemonDetail(pokemonDetail);
        final species = await DataSource.fetchSpecies(pokemonDetail.speciesUrl);

        if (species == null) return;

        await SpeciesRepository.setSpecies(pokemonDetail.speciesUrl, species);
        final evolutionChain = await DataSource.fetchEvolutionChain(species.evolutionChainUrl);

        if (evolutionChain == null) return;

        await EvolutionChainRepository.setEvolutionChain(species.evolutionChainUrl, evolutionChain);
      }).then((value) => fetchPokemonState(skipNetwork: true));
    }
    final pokemonDetail = await PokemonDetailRepository.getPokemonDetail(name);
    final species = await SpeciesRepository.getSpecies(pokemonDetail?.speciesUrl);
    final evolutionChain = await EvolutionChainRepository.getEvolutionChain(species?.evolutionChainUrl);
    final paletteGenerator = await getColor(pokemonDetail);
    if (!isClosed) {
      emit(PokemonState(pokemonDetail: pokemonDetail, evolutionChain: evolutionChain, paletteGenerator: paletteGenerator, species: species));
    }
  }

  Future<PaletteGenerator?> getColor(PokemonDetail? pokemonDetail) async {
    final sprites = pokemonDetail?.sprites;
    if (sprites == null) return null;

    final pokemonSprite = sprites.frontDefault ??
        sprites.backDefault ??
        sprites.backFemale ??
        sprites.backShiny ??
        sprites.backShinyFemale ??
        sprites.frontDefault ??
        sprites.frontFemale ??
        sprites.frontShiny ??
        sprites.frontShinyFemale;
    if (pokemonSprite == null) return null;

    final paletteGenerator = await PaletteGenerator.fromImageProvider(NetworkImage(pokemonSprite));
    return paletteGenerator;
  }

  List<EvolutionMap> get evolutionChains {
    final evolutionMaps = <EvolutionMap>[];
    parseEvolutionChain(evolutionMaps, state.evolutionChain);
    return evolutionMaps;
  }

  void parseEvolutionChain(List<EvolutionMap> evolutionMaps, EvolutionChain? evolutionChain) {
    if (evolutionChain == null) return;

    for (var evolveTo in evolutionChain.evolveTo ?? <EvolutionChain?>[]) {
      evolutionMaps.add(
        EvolutionMap()
          ..fromSpeciesUrl = evolutionChain.speciesUrl
          ..toSpeciesUrl = evolveTo?.speciesUrl
          ..evolutionDetail = evolutionChain.evolutionDetail,
      );
      parseEvolutionChain(evolutionMaps, evolveTo);
    }
  }

  String? get image {
    return state.pokemonDetail?.sprites?.frontDefault ??
        state.pokemonDetail?.sprites?.backDefault ??
        state.pokemonDetail?.sprites?.backFemale ??
        state.pokemonDetail?.sprites?.backShiny ??
        state.pokemonDetail?.sprites?.backShinyFemale ??
        state.pokemonDetail?.sprites?.frontDefault ??
        state.pokemonDetail?.sprites?.frontFemale ??
        state.pokemonDetail?.sprites?.frontShiny ??
        state.pokemonDetail?.sprites?.frontShinyFemale;
  }
}
