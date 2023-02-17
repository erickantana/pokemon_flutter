import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_sources/data_source.dart';
import '../../podo/evolution_detail.dart';
import '../../podo/pokemon_detail.dart';
import '../../repositories/pokemon_detail_repository.dart';
import '../../repositories/species_repository.dart';
import 'pokemon_cubit.dart';

class EvolutionState {
  List<PokemonDetail>? fromPokemons;
  List<PokemonDetail>? toPokemons;
  List<EvolutionDetail?>? evolutionDetails;

  EvolutionState({this.fromPokemons, this.toPokemons, this.evolutionDetails});
}

class PokemonEvolutionCubit extends Cubit<EvolutionState?> {
  final EvolutionMap evolutionMap;

  PokemonEvolutionCubit(this.evolutionMap) : super(null);

  Future<void> fetchEvolution({bool skipNetwork = false}) async {
    if (!skipNetwork) {
      Future(() async {
        final fromSpecies = await DataSource.fetchSpecies(evolutionMap.fromSpeciesUrl);
        if (fromSpecies != null) await SpeciesRepository.setSpecies(evolutionMap.fromSpeciesUrl, fromSpecies);
        final fromPokemons = <PokemonDetail>[];
        for (final variety in fromSpecies?.varieties ?? <String>[]) {
          final pokemonDetail = await DataSource.fetchPokemonDetail(variety);
          if (pokemonDetail != null) {
            await PokemonDetailRepository.setPokemonDetail(pokemonDetail);
            fromPokemons.add(pokemonDetail);
          }
        }

        final toSpecies = await DataSource.fetchSpecies(evolutionMap.toSpeciesUrl);
        if (toSpecies != null) await SpeciesRepository.setSpecies(evolutionMap.toSpeciesUrl, toSpecies);
        final toPokemons = <PokemonDetail>[];
        for (final variety in toSpecies?.varieties ?? <String>[]) {
          final pokemonDetail = await DataSource.fetchPokemonDetail(variety);
          if (pokemonDetail != null) {
            await PokemonDetailRepository.setPokemonDetail(pokemonDetail);
            toPokemons.add(pokemonDetail);
          }
        }
      }).then((value) => fetchEvolution(skipNetwork: true));
    }
    final fromSpecies = await SpeciesRepository.getSpecies(evolutionMap.fromSpeciesUrl);
    final fromPokemons = <PokemonDetail>[];
    for (final variety in fromSpecies?.varieties ?? <String>[]) {
      final pokemon = await PokemonDetailRepository.getPokemonDetail(variety);
      if (pokemon != null) fromPokemons.add(pokemon);
    }

    final toSpecies = await SpeciesRepository.getSpecies(evolutionMap.toSpeciesUrl);
    final toPokemons = <PokemonDetail>[];
    for (final variety in toSpecies?.varieties ?? <String>[]) {
      final pokemon = await PokemonDetailRepository.getPokemonDetail(variety);
      if (pokemon != null) toPokemons.add(pokemon);
    }
    if (!isClosed) emit(EvolutionState(fromPokemons: fromPokemons, toPokemons: toPokemons, evolutionDetails: evolutionMap.evolutionDetail));
  }
}
