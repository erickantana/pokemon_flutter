import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_sources/data_source.dart';
import '../../podo/pokemon_detail.dart';
import '../../repositories/pokemon_detail_repository.dart';

class PokemonSpeciesVarietyCubit extends Cubit<PokemonDetail?> {
  final String pokemonName;

  PokemonSpeciesVarietyCubit(this.pokemonName) : super(null) {
    _fetchLocal();
    _fetchRemote();
  }

  Future<void> _fetchLocal() async {
    final pokemonDetail = await PokemonDetailRepository.getPokemonDetail(pokemonName);
    emit(pokemonDetail);
  }

  Future<void> _fetchRemote() async {
    final pokemonDetail = await DataSource.fetchPokemonDetail(pokemonName);
    if (pokemonDetail != null) {
      await PokemonDetailRepository.setPokemonDetail(pokemonDetail);
      _fetchLocal();
    }
  }

  String? get image {
    return state?.sprites?.frontDefault ??
        state?.sprites?.backDefault ??
        state?.sprites?.backFemale ??
        state?.sprites?.backShiny ??
        state?.sprites?.backShinyFemale ??
        state?.sprites?.frontDefault ??
        state?.sprites?.frontFemale ??
        state?.sprites?.frontShiny ??
        state?.sprites?.frontShinyFemale;
  }
}
