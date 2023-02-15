import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../constants/env.dart';
import '../schemas/schema.graphql.dart';

class DataSource {
  static final HttpLink _httpLink = HttpLink(Env.endPoint);
  static final GraphQLClient _client = GraphQLClient(link: _httpLink, cache: GraphQLCache(store: HiveStore()));

  static Future<Query$pokemons$pokemons?> fetchPokemons({required int limit, required int offset}) async {
    log("Pokemon@Fetch Pokemon@remote: (limit: $limit, offset: $offset)");
    final variables = Variables$Query$pokemons(limit: limit, offset: offset);
    final options = Options$Query$pokemons(variables: variables);
    final queryResult = await _client.query(options);
    return queryResult.parsedData?.pokemons;
  }

  static Future<Query$pokemon$pokemon?> fetchPokemon(String name) async {
    final variables = Variables$Query$pokemon(name: name);
    final options = Options$Query$pokemon(variables: variables);
    final queryResult = await _client.query(options);
    return queryResult.parsedData?.pokemon;
  }
}
