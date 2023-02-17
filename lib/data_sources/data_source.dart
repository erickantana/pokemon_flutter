import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

import '../constants/env.dart';
import '../podo/encounter.dart';
import '../podo/evolution_chain.dart';
import '../podo/pokemon_detail.dart';
import '../podo/species.dart';
import '../schemas/schema.graphql.dart';

class DataSource {
  static final HttpLink _httpLink = HttpLink(Env.endPoint);
  static final GraphQLClient _client = GraphQLClient(link: _httpLink, cache: GraphQLCache(store: HiveStore()));

  static Future<Query$pokemons$pokemons?> fetchPokemons({required int limit, required int offset}) async {
    final variables = Variables$Query$pokemons(limit: limit, offset: offset);
    final options = Options$Query$pokemons(variables: variables);
    final queryResult = await _client.query(options);
    return queryResult.parsedData?.pokemons;
  }

  static Future<PokemonDetail?> fetchPokemonDetail(String name) async {
    final variables = Variables$Query$pokemon(name: name);
    final options = Options$Query$pokemon(variables: variables);
    final queryResult = (await _client.query(options)).parsedData?.pokemon;

    final encounters = await fetchEncounters(queryResult?.location_area_encounters);

    return PokemonDetail.fromQueryResult(queryResult: queryResult, encounters: encounters);
  }

  static Future<List<Encounter?>?> fetchEncounters(String? locationEncounterUrl) async {
    if (locationEncounterUrl == null) return null;

    final response = await http.get(Uri.parse(locationEncounterUrl));
    final encounterJsonArray = jsonDecode(response.body) as List<dynamic>;
    return [for (final encounterJson in encounterJsonArray) Encounter.fromJson(encounterJson)];
  }

  static Future<EvolutionChain?> fetchEvolutionChain(String? evolutionChainUrl) async {
    if (evolutionChainUrl == null) return null;

    final response = await http.get(Uri.parse(evolutionChainUrl));
    final chain = jsonDecode(response.body)["chain"];
    return EvolutionChain.fromJson(chain);
  }

  static Future<Species?> fetchSpecies(String? speciesUrl) async {
    if (speciesUrl == null) return null;

    final response = await http.get(Uri.parse(speciesUrl));
    return Species.fromJson(jsonDecode(response.body));
  }
}
