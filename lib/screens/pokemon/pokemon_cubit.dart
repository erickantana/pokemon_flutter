import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';

import '../../data_sources/data_source.dart';
import '../../podo/encounter.dart';
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
  EvolutionChain? evolutionChain;

  PokemonState({this.pokemonDetail, this.evolutionChain, this.paletteGenerator});
}

class PokemonCubit extends Cubit<PokemonState> {
  final String name;

  PokemonCubit(this.name) : super(PokemonState());

  Future<void> fetchPokemonState() async {
    final pokemonDetail = await fetchPokemonDetail(name);
    print("Pokemon@${pokemonDetail.toString()}");
    final evolutionChain = await fetchEvolutionChain(pokemonDetail?.evolutionChainUrl);
    final paletteGenerator = await getColor(pokemonDetail);
    emit(PokemonState(pokemonDetail: pokemonDetail, evolutionChain: evolutionChain, paletteGenerator: paletteGenerator));
  }

  Future<PokemonDetail?> fetchPokemonDetail(String? name) async {
    if (name == null) return null;

    final pokemonDetail = await PokemonDetailRepository.getPokemonDetail(name);
    DataSource.fetchPokemon(name).then((pokemonQueryResult) async {
      if (pokemonQueryResult == null) return;

      final encounters = await _fetchLocation(pokemonQueryResult.location_area_encounters);

      final speciesUrl = pokemonQueryResult.species?.url;
      final evolutionChainUrl = await _fetchEvolutionChainUrl(speciesUrl);
      PokemonDetail? pokemonDetail = PokemonDetail.fromQueryResult(
        queryResult: pokemonQueryResult,
        encounters: encounters,
        evolutionChainUrl: evolutionChainUrl,
        speciesUrl: speciesUrl,
      );
      if (pokemonDetail != null) await PokemonDetailRepository.setPokemonDetail(pokemonDetail);

      pokemonDetail = await PokemonDetailRepository.getPokemonDetail(name);
      final paletteGenerator = await getColor(pokemonDetail);
      emit(PokemonState(pokemonDetail: pokemonDetail, evolutionChain: state.evolutionChain, paletteGenerator: paletteGenerator));
    });
    return pokemonDetail;
  }

  Future<EvolutionChain?> fetchEvolutionChain(String? evolutionChainUrl) async {
    if (evolutionChainUrl == null) return null;
    final evolutionChain = await EvolutionChainRepository.getEvolutionChain(evolutionChainUrl);
    http.get(Uri.parse(evolutionChainUrl)).then((response) {
      final chain = jsonDecode(response.body)["chain"];
      final evolutionChain = parseEvolutionChain(chain);
      log("Pokemon@evolutionChain: $evolutionChain");
      emit(PokemonState(pokemonDetail: state.pokemonDetail, evolutionChain: evolutionChain, paletteGenerator: state.paletteGenerator));
    });
    return evolutionChain;
  }

  EvolutionChain parseEvolutionChain(Map<String, dynamic> chain) {
    final evolutionChain = EvolutionChain()
      ..speciesName = chain["species"]["name"]
      ..speciesUrl = chain["species"]["url"]
      ..evolveTo = [
        for (final evolveTo in chain["evolves_to"]) parseEvolutionChain(evolveTo),
      ]
      ..evolutionDetail = [
        for (final evolutionDetail in chain["evolution_details"]) EvolutionDetail.fromJson(evolutionDetail),
      ];
    return evolutionChain;
  }

  Future<Species?> fetchSpecies(String speciesUrl) async {
    final species = await SpeciesRepository.getSpecies(speciesUrl);
    return species;
  }

  Future<String?> _fetchEvolutionChainUrl(String? speciesUrl) async {
    if (speciesUrl == null) return null;

    final speciesResponse = await http.get(Uri.parse(speciesUrl));
    return jsonDecode(speciesResponse.body)["evolution_chain"]["url"];
  }

  Future<List<Encounter?>?> _fetchLocation(String? locationUrl) async {
    if (locationUrl == null) return null;

    final response = await http.get(Uri.parse(locationUrl));
    final encounterJsonArray = jsonDecode(response.body) as List<dynamic>;
    return [for (final encounterJson in encounterJsonArray) Encounter.fromJson(encounterJson)];
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
}
