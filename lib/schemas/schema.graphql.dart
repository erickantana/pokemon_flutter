import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$pokemon {
  factory Variables$Query$pokemon({required String name}) =>
      Variables$Query$pokemon._({
        r'name': name,
      });

  Variables$Query$pokemon._(this._$data);

  factory Variables$Query$pokemon.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    return Variables$Query$pokemon._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    return result$data;
  }

  CopyWith$Variables$Query$pokemon<Variables$Query$pokemon> get copyWith =>
      CopyWith$Variables$Query$pokemon(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$pokemon) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    return Object.hashAll([l$name]);
  }
}

abstract class CopyWith$Variables$Query$pokemon<TRes> {
  factory CopyWith$Variables$Query$pokemon(
    Variables$Query$pokemon instance,
    TRes Function(Variables$Query$pokemon) then,
  ) = _CopyWithImpl$Variables$Query$pokemon;

  factory CopyWith$Variables$Query$pokemon.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$pokemon;

  TRes call({String? name});
}

class _CopyWithImpl$Variables$Query$pokemon<TRes>
    implements CopyWith$Variables$Query$pokemon<TRes> {
  _CopyWithImpl$Variables$Query$pokemon(
    this._instance,
    this._then,
  );

  final Variables$Query$pokemon _instance;

  final TRes Function(Variables$Query$pokemon) _then;

  static const _undefined = {};

  TRes call({Object? name = _undefined}) => _then(Variables$Query$pokemon._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$pokemon<TRes>
    implements CopyWith$Variables$Query$pokemon<TRes> {
  _CopyWithStubImpl$Variables$Query$pokemon(this._res);

  TRes _res;

  call({String? name}) => _res;
}

class Query$pokemon {
  Query$pokemon({
    this.pokemon,
    required this.$__typename,
  });

  factory Query$pokemon.fromJson(Map<String, dynamic> json) {
    final l$pokemon = json['pokemon'];
    final l$$__typename = json['__typename'];
    return Query$pokemon(
      pokemon: l$pokemon == null
          ? null
          : Query$pokemon$pokemon.fromJson((l$pokemon as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$pokemon$pokemon? pokemon;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pokemon = pokemon;
    _resultData['pokemon'] = l$pokemon?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pokemon = pokemon;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pokemon,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$pokemon = pokemon;
    final lOther$pokemon = other.pokemon;
    if (l$pokemon != lOther$pokemon) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon on Query$pokemon {
  CopyWith$Query$pokemon<Query$pokemon> get copyWith => CopyWith$Query$pokemon(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$pokemon<TRes> {
  factory CopyWith$Query$pokemon(
    Query$pokemon instance,
    TRes Function(Query$pokemon) then,
  ) = _CopyWithImpl$Query$pokemon;

  factory CopyWith$Query$pokemon.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon;

  TRes call({
    Query$pokemon$pokemon? pokemon,
    String? $__typename,
  });
  CopyWith$Query$pokemon$pokemon<TRes> get pokemon;
}

class _CopyWithImpl$Query$pokemon<TRes>
    implements CopyWith$Query$pokemon<TRes> {
  _CopyWithImpl$Query$pokemon(
    this._instance,
    this._then,
  );

  final Query$pokemon _instance;

  final TRes Function(Query$pokemon) _then;

  static const _undefined = {};

  TRes call({
    Object? pokemon = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon(
        pokemon: pokemon == _undefined
            ? _instance.pokemon
            : (pokemon as Query$pokemon$pokemon?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$pokemon$pokemon<TRes> get pokemon {
    final local$pokemon = _instance.pokemon;
    return local$pokemon == null
        ? CopyWith$Query$pokemon$pokemon.stub(_then(_instance))
        : CopyWith$Query$pokemon$pokemon(
            local$pokemon, (e) => call(pokemon: e));
  }
}

class _CopyWithStubImpl$Query$pokemon<TRes>
    implements CopyWith$Query$pokemon<TRes> {
  _CopyWithStubImpl$Query$pokemon(this._res);

  TRes _res;

  call({
    Query$pokemon$pokemon? pokemon,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$pokemon$pokemon<TRes> get pokemon =>
      CopyWith$Query$pokemon$pokemon.stub(_res);
}

const documentNodeQuerypokemon = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'pokemon'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'pokemon'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sprites'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'back_default'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'back_female'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'back_shiny'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'back_shiny_female'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'front_default'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'front_female'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'front_shiny'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'front_shiny_female'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'location_area_encounters'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'height'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'weight'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'species'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'url'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'stats'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'stat'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'base_stat'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'effort'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'moves'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'move'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'abilities'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'ability'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'slot'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'is_hidden'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'types'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$pokemon _parserFn$Query$pokemon(Map<String, dynamic> data) =>
    Query$pokemon.fromJson(data);

class Options$Query$pokemon extends graphql.QueryOptions<Query$pokemon> {
  Options$Query$pokemon({
    String? operationName,
    required Variables$Query$pokemon variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerypokemon,
          parserFn: _parserFn$Query$pokemon,
        );
}

class WatchOptions$Query$pokemon
    extends graphql.WatchQueryOptions<Query$pokemon> {
  WatchOptions$Query$pokemon({
    String? operationName,
    required Variables$Query$pokemon variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerypokemon,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$pokemon,
        );
}

class FetchMoreOptions$Query$pokemon extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$pokemon({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$pokemon variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerypokemon,
        );
}

extension ClientExtension$Query$pokemon on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$pokemon>> query$pokemon(
          Options$Query$pokemon options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$pokemon> watchQuery$pokemon(
          WatchOptions$Query$pokemon options) =>
      this.watchQuery(options);
  void writeQuery$pokemon({
    required Query$pokemon data,
    required Variables$Query$pokemon variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerypokemon),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$pokemon? readQuery$pokemon({
    required Variables$Query$pokemon variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerypokemon),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$pokemon.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$pokemon> useQuery$pokemon(
        Options$Query$pokemon options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$pokemon> useWatchQuery$pokemon(
        WatchOptions$Query$pokemon options) =>
    graphql_flutter.useWatchQuery(options);

class Query$pokemon$Widget extends graphql_flutter.Query<Query$pokemon> {
  Query$pokemon$Widget({
    widgets.Key? key,
    required Options$Query$pokemon options,
    required graphql_flutter.QueryBuilder<Query$pokemon> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$pokemon$pokemon {
  Query$pokemon$pokemon({
    this.id,
    this.name,
    this.sprites,
    this.location_area_encounters,
    this.height,
    this.weight,
    this.species,
    this.stats,
    this.moves,
    this.abilities,
    this.types,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$sprites = json['sprites'];
    final l$location_area_encounters = json['location_area_encounters'];
    final l$height = json['height'];
    final l$weight = json['weight'];
    final l$species = json['species'];
    final l$stats = json['stats'];
    final l$moves = json['moves'];
    final l$abilities = json['abilities'];
    final l$types = json['types'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon(
      id: (l$id as int?),
      name: (l$name as String?),
      sprites: l$sprites == null
          ? null
          : Query$pokemon$pokemon$sprites.fromJson(
              (l$sprites as Map<String, dynamic>)),
      location_area_encounters: (l$location_area_encounters as String?),
      height: (l$height as int?),
      weight: (l$weight as int?),
      species: l$species == null
          ? null
          : Query$pokemon$pokemon$species.fromJson(
              (l$species as Map<String, dynamic>)),
      stats: (l$stats as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$pokemon$pokemon$stats.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      moves: (l$moves as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$pokemon$pokemon$moves.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      abilities: (l$abilities as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$pokemon$pokemon$abilities.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      types: (l$types as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$pokemon$pokemon$types.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int? id;

  final String? name;

  final Query$pokemon$pokemon$sprites? sprites;

  final String? location_area_encounters;

  final int? height;

  final int? weight;

  final Query$pokemon$pokemon$species? species;

  final List<Query$pokemon$pokemon$stats?>? stats;

  final List<Query$pokemon$pokemon$moves?>? moves;

  final List<Query$pokemon$pokemon$abilities?>? abilities;

  final List<Query$pokemon$pokemon$types?>? types;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$sprites = sprites;
    _resultData['sprites'] = l$sprites?.toJson();
    final l$location_area_encounters = location_area_encounters;
    _resultData['location_area_encounters'] = l$location_area_encounters;
    final l$height = height;
    _resultData['height'] = l$height;
    final l$weight = weight;
    _resultData['weight'] = l$weight;
    final l$species = species;
    _resultData['species'] = l$species?.toJson();
    final l$stats = stats;
    _resultData['stats'] = l$stats?.map((e) => e?.toJson()).toList();
    final l$moves = moves;
    _resultData['moves'] = l$moves?.map((e) => e?.toJson()).toList();
    final l$abilities = abilities;
    _resultData['abilities'] = l$abilities?.map((e) => e?.toJson()).toList();
    final l$types = types;
    _resultData['types'] = l$types?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$sprites = sprites;
    final l$location_area_encounters = location_area_encounters;
    final l$height = height;
    final l$weight = weight;
    final l$species = species;
    final l$stats = stats;
    final l$moves = moves;
    final l$abilities = abilities;
    final l$types = types;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$sprites,
      l$location_area_encounters,
      l$height,
      l$weight,
      l$species,
      l$stats == null ? null : Object.hashAll(l$stats.map((v) => v)),
      l$moves == null ? null : Object.hashAll(l$moves.map((v) => v)),
      l$abilities == null ? null : Object.hashAll(l$abilities.map((v) => v)),
      l$types == null ? null : Object.hashAll(l$types.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$sprites = sprites;
    final lOther$sprites = other.sprites;
    if (l$sprites != lOther$sprites) {
      return false;
    }
    final l$location_area_encounters = location_area_encounters;
    final lOther$location_area_encounters = other.location_area_encounters;
    if (l$location_area_encounters != lOther$location_area_encounters) {
      return false;
    }
    final l$height = height;
    final lOther$height = other.height;
    if (l$height != lOther$height) {
      return false;
    }
    final l$weight = weight;
    final lOther$weight = other.weight;
    if (l$weight != lOther$weight) {
      return false;
    }
    final l$species = species;
    final lOther$species = other.species;
    if (l$species != lOther$species) {
      return false;
    }
    final l$stats = stats;
    final lOther$stats = other.stats;
    if (l$stats != null && lOther$stats != null) {
      if (l$stats.length != lOther$stats.length) {
        return false;
      }
      for (int i = 0; i < l$stats.length; i++) {
        final l$stats$entry = l$stats[i];
        final lOther$stats$entry = lOther$stats[i];
        if (l$stats$entry != lOther$stats$entry) {
          return false;
        }
      }
    } else if (l$stats != lOther$stats) {
      return false;
    }
    final l$moves = moves;
    final lOther$moves = other.moves;
    if (l$moves != null && lOther$moves != null) {
      if (l$moves.length != lOther$moves.length) {
        return false;
      }
      for (int i = 0; i < l$moves.length; i++) {
        final l$moves$entry = l$moves[i];
        final lOther$moves$entry = lOther$moves[i];
        if (l$moves$entry != lOther$moves$entry) {
          return false;
        }
      }
    } else if (l$moves != lOther$moves) {
      return false;
    }
    final l$abilities = abilities;
    final lOther$abilities = other.abilities;
    if (l$abilities != null && lOther$abilities != null) {
      if (l$abilities.length != lOther$abilities.length) {
        return false;
      }
      for (int i = 0; i < l$abilities.length; i++) {
        final l$abilities$entry = l$abilities[i];
        final lOther$abilities$entry = lOther$abilities[i];
        if (l$abilities$entry != lOther$abilities$entry) {
          return false;
        }
      }
    } else if (l$abilities != lOther$abilities) {
      return false;
    }
    final l$types = types;
    final lOther$types = other.types;
    if (l$types != null && lOther$types != null) {
      if (l$types.length != lOther$types.length) {
        return false;
      }
      for (int i = 0; i < l$types.length; i++) {
        final l$types$entry = l$types[i];
        final lOther$types$entry = lOther$types[i];
        if (l$types$entry != lOther$types$entry) {
          return false;
        }
      }
    } else if (l$types != lOther$types) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon on Query$pokemon$pokemon {
  CopyWith$Query$pokemon$pokemon<Query$pokemon$pokemon> get copyWith =>
      CopyWith$Query$pokemon$pokemon(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$pokemon$pokemon<TRes> {
  factory CopyWith$Query$pokemon$pokemon(
    Query$pokemon$pokemon instance,
    TRes Function(Query$pokemon$pokemon) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon;

  factory CopyWith$Query$pokemon$pokemon.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon;

  TRes call({
    int? id,
    String? name,
    Query$pokemon$pokemon$sprites? sprites,
    String? location_area_encounters,
    int? height,
    int? weight,
    Query$pokemon$pokemon$species? species,
    List<Query$pokemon$pokemon$stats?>? stats,
    List<Query$pokemon$pokemon$moves?>? moves,
    List<Query$pokemon$pokemon$abilities?>? abilities,
    List<Query$pokemon$pokemon$types?>? types,
    String? $__typename,
  });
  CopyWith$Query$pokemon$pokemon$sprites<TRes> get sprites;
  CopyWith$Query$pokemon$pokemon$species<TRes> get species;
  TRes stats(
      Iterable<Query$pokemon$pokemon$stats?>? Function(
              Iterable<
                  CopyWith$Query$pokemon$pokemon$stats<
                      Query$pokemon$pokemon$stats>?>?)
          _fn);
  TRes moves(
      Iterable<Query$pokemon$pokemon$moves?>? Function(
              Iterable<
                  CopyWith$Query$pokemon$pokemon$moves<
                      Query$pokemon$pokemon$moves>?>?)
          _fn);
  TRes abilities(
      Iterable<Query$pokemon$pokemon$abilities?>? Function(
              Iterable<
                  CopyWith$Query$pokemon$pokemon$abilities<
                      Query$pokemon$pokemon$abilities>?>?)
          _fn);
  TRes types(
      Iterable<Query$pokemon$pokemon$types?>? Function(
              Iterable<
                  CopyWith$Query$pokemon$pokemon$types<
                      Query$pokemon$pokemon$types>?>?)
          _fn);
}

class _CopyWithImpl$Query$pokemon$pokemon<TRes>
    implements CopyWith$Query$pokemon$pokemon<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon _instance;

  final TRes Function(Query$pokemon$pokemon) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? sprites = _undefined,
    Object? location_area_encounters = _undefined,
    Object? height = _undefined,
    Object? weight = _undefined,
    Object? species = _undefined,
    Object? stats = _undefined,
    Object? moves = _undefined,
    Object? abilities = _undefined,
    Object? types = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon(
        id: id == _undefined ? _instance.id : (id as int?),
        name: name == _undefined ? _instance.name : (name as String?),
        sprites: sprites == _undefined
            ? _instance.sprites
            : (sprites as Query$pokemon$pokemon$sprites?),
        location_area_encounters: location_area_encounters == _undefined
            ? _instance.location_area_encounters
            : (location_area_encounters as String?),
        height: height == _undefined ? _instance.height : (height as int?),
        weight: weight == _undefined ? _instance.weight : (weight as int?),
        species: species == _undefined
            ? _instance.species
            : (species as Query$pokemon$pokemon$species?),
        stats: stats == _undefined
            ? _instance.stats
            : (stats as List<Query$pokemon$pokemon$stats?>?),
        moves: moves == _undefined
            ? _instance.moves
            : (moves as List<Query$pokemon$pokemon$moves?>?),
        abilities: abilities == _undefined
            ? _instance.abilities
            : (abilities as List<Query$pokemon$pokemon$abilities?>?),
        types: types == _undefined
            ? _instance.types
            : (types as List<Query$pokemon$pokemon$types?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$pokemon$pokemon$sprites<TRes> get sprites {
    final local$sprites = _instance.sprites;
    return local$sprites == null
        ? CopyWith$Query$pokemon$pokemon$sprites.stub(_then(_instance))
        : CopyWith$Query$pokemon$pokemon$sprites(
            local$sprites, (e) => call(sprites: e));
  }

  CopyWith$Query$pokemon$pokemon$species<TRes> get species {
    final local$species = _instance.species;
    return local$species == null
        ? CopyWith$Query$pokemon$pokemon$species.stub(_then(_instance))
        : CopyWith$Query$pokemon$pokemon$species(
            local$species, (e) => call(species: e));
  }

  TRes stats(
          Iterable<Query$pokemon$pokemon$stats?>? Function(
                  Iterable<
                      CopyWith$Query$pokemon$pokemon$stats<
                          Query$pokemon$pokemon$stats>?>?)
              _fn) =>
      call(
          stats: _fn(_instance.stats?.map((e) => e == null
              ? null
              : CopyWith$Query$pokemon$pokemon$stats(
                  e,
                  (i) => i,
                )))?.toList());
  TRes moves(
          Iterable<Query$pokemon$pokemon$moves?>? Function(
                  Iterable<
                      CopyWith$Query$pokemon$pokemon$moves<
                          Query$pokemon$pokemon$moves>?>?)
              _fn) =>
      call(
          moves: _fn(_instance.moves?.map((e) => e == null
              ? null
              : CopyWith$Query$pokemon$pokemon$moves(
                  e,
                  (i) => i,
                )))?.toList());
  TRes abilities(
          Iterable<Query$pokemon$pokemon$abilities?>? Function(
                  Iterable<
                      CopyWith$Query$pokemon$pokemon$abilities<
                          Query$pokemon$pokemon$abilities>?>?)
              _fn) =>
      call(
          abilities: _fn(_instance.abilities?.map((e) => e == null
              ? null
              : CopyWith$Query$pokemon$pokemon$abilities(
                  e,
                  (i) => i,
                )))?.toList());
  TRes types(
          Iterable<Query$pokemon$pokemon$types?>? Function(
                  Iterable<
                      CopyWith$Query$pokemon$pokemon$types<
                          Query$pokemon$pokemon$types>?>?)
              _fn) =>
      call(
          types: _fn(_instance.types?.map((e) => e == null
              ? null
              : CopyWith$Query$pokemon$pokemon$types(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$pokemon$pokemon<TRes>
    implements CopyWith$Query$pokemon$pokemon<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Query$pokemon$pokemon$sprites? sprites,
    String? location_area_encounters,
    int? height,
    int? weight,
    Query$pokemon$pokemon$species? species,
    List<Query$pokemon$pokemon$stats?>? stats,
    List<Query$pokemon$pokemon$moves?>? moves,
    List<Query$pokemon$pokemon$abilities?>? abilities,
    List<Query$pokemon$pokemon$types?>? types,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$pokemon$pokemon$sprites<TRes> get sprites =>
      CopyWith$Query$pokemon$pokemon$sprites.stub(_res);
  CopyWith$Query$pokemon$pokemon$species<TRes> get species =>
      CopyWith$Query$pokemon$pokemon$species.stub(_res);
  stats(_fn) => _res;
  moves(_fn) => _res;
  abilities(_fn) => _res;
  types(_fn) => _res;
}

class Query$pokemon$pokemon$sprites {
  Query$pokemon$pokemon$sprites({
    this.back_default,
    this.back_female,
    this.back_shiny,
    this.back_shiny_female,
    this.front_default,
    this.front_female,
    this.front_shiny,
    this.front_shiny_female,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon$sprites.fromJson(Map<String, dynamic> json) {
    final l$back_default = json['back_default'];
    final l$back_female = json['back_female'];
    final l$back_shiny = json['back_shiny'];
    final l$back_shiny_female = json['back_shiny_female'];
    final l$front_default = json['front_default'];
    final l$front_female = json['front_female'];
    final l$front_shiny = json['front_shiny'];
    final l$front_shiny_female = json['front_shiny_female'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon$sprites(
      back_default: (l$back_default as String?),
      back_female: (l$back_female as String?),
      back_shiny: (l$back_shiny as String?),
      back_shiny_female: (l$back_shiny_female as String?),
      front_default: (l$front_default as String?),
      front_female: (l$front_female as String?),
      front_shiny: (l$front_shiny as String?),
      front_shiny_female: (l$front_shiny_female as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? back_default;

  final String? back_female;

  final String? back_shiny;

  final String? back_shiny_female;

  final String? front_default;

  final String? front_female;

  final String? front_shiny;

  final String? front_shiny_female;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$back_default = back_default;
    _resultData['back_default'] = l$back_default;
    final l$back_female = back_female;
    _resultData['back_female'] = l$back_female;
    final l$back_shiny = back_shiny;
    _resultData['back_shiny'] = l$back_shiny;
    final l$back_shiny_female = back_shiny_female;
    _resultData['back_shiny_female'] = l$back_shiny_female;
    final l$front_default = front_default;
    _resultData['front_default'] = l$front_default;
    final l$front_female = front_female;
    _resultData['front_female'] = l$front_female;
    final l$front_shiny = front_shiny;
    _resultData['front_shiny'] = l$front_shiny;
    final l$front_shiny_female = front_shiny_female;
    _resultData['front_shiny_female'] = l$front_shiny_female;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$back_default = back_default;
    final l$back_female = back_female;
    final l$back_shiny = back_shiny;
    final l$back_shiny_female = back_shiny_female;
    final l$front_default = front_default;
    final l$front_female = front_female;
    final l$front_shiny = front_shiny;
    final l$front_shiny_female = front_shiny_female;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$back_default,
      l$back_female,
      l$back_shiny,
      l$back_shiny_female,
      l$front_default,
      l$front_female,
      l$front_shiny,
      l$front_shiny_female,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon$sprites) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$back_default = back_default;
    final lOther$back_default = other.back_default;
    if (l$back_default != lOther$back_default) {
      return false;
    }
    final l$back_female = back_female;
    final lOther$back_female = other.back_female;
    if (l$back_female != lOther$back_female) {
      return false;
    }
    final l$back_shiny = back_shiny;
    final lOther$back_shiny = other.back_shiny;
    if (l$back_shiny != lOther$back_shiny) {
      return false;
    }
    final l$back_shiny_female = back_shiny_female;
    final lOther$back_shiny_female = other.back_shiny_female;
    if (l$back_shiny_female != lOther$back_shiny_female) {
      return false;
    }
    final l$front_default = front_default;
    final lOther$front_default = other.front_default;
    if (l$front_default != lOther$front_default) {
      return false;
    }
    final l$front_female = front_female;
    final lOther$front_female = other.front_female;
    if (l$front_female != lOther$front_female) {
      return false;
    }
    final l$front_shiny = front_shiny;
    final lOther$front_shiny = other.front_shiny;
    if (l$front_shiny != lOther$front_shiny) {
      return false;
    }
    final l$front_shiny_female = front_shiny_female;
    final lOther$front_shiny_female = other.front_shiny_female;
    if (l$front_shiny_female != lOther$front_shiny_female) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon$sprites
    on Query$pokemon$pokemon$sprites {
  CopyWith$Query$pokemon$pokemon$sprites<Query$pokemon$pokemon$sprites>
      get copyWith => CopyWith$Query$pokemon$pokemon$sprites(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemon$pokemon$sprites<TRes> {
  factory CopyWith$Query$pokemon$pokemon$sprites(
    Query$pokemon$pokemon$sprites instance,
    TRes Function(Query$pokemon$pokemon$sprites) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon$sprites;

  factory CopyWith$Query$pokemon$pokemon$sprites.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon$sprites;

  TRes call({
    String? back_default,
    String? back_female,
    String? back_shiny,
    String? back_shiny_female,
    String? front_default,
    String? front_female,
    String? front_shiny,
    String? front_shiny_female,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pokemon$pokemon$sprites<TRes>
    implements CopyWith$Query$pokemon$pokemon$sprites<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon$sprites(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon$sprites _instance;

  final TRes Function(Query$pokemon$pokemon$sprites) _then;

  static const _undefined = {};

  TRes call({
    Object? back_default = _undefined,
    Object? back_female = _undefined,
    Object? back_shiny = _undefined,
    Object? back_shiny_female = _undefined,
    Object? front_default = _undefined,
    Object? front_female = _undefined,
    Object? front_shiny = _undefined,
    Object? front_shiny_female = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon$sprites(
        back_default: back_default == _undefined
            ? _instance.back_default
            : (back_default as String?),
        back_female: back_female == _undefined
            ? _instance.back_female
            : (back_female as String?),
        back_shiny: back_shiny == _undefined
            ? _instance.back_shiny
            : (back_shiny as String?),
        back_shiny_female: back_shiny_female == _undefined
            ? _instance.back_shiny_female
            : (back_shiny_female as String?),
        front_default: front_default == _undefined
            ? _instance.front_default
            : (front_default as String?),
        front_female: front_female == _undefined
            ? _instance.front_female
            : (front_female as String?),
        front_shiny: front_shiny == _undefined
            ? _instance.front_shiny
            : (front_shiny as String?),
        front_shiny_female: front_shiny_female == _undefined
            ? _instance.front_shiny_female
            : (front_shiny_female as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$pokemon$pokemon$sprites<TRes>
    implements CopyWith$Query$pokemon$pokemon$sprites<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon$sprites(this._res);

  TRes _res;

  call({
    String? back_default,
    String? back_female,
    String? back_shiny,
    String? back_shiny_female,
    String? front_default,
    String? front_female,
    String? front_shiny,
    String? front_shiny_female,
    String? $__typename,
  }) =>
      _res;
}

class Query$pokemon$pokemon$species {
  Query$pokemon$pokemon$species({
    this.id,
    this.name,
    this.url,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon$species.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon$species(
      id: (l$id as String?),
      name: (l$name as String?),
      url: (l$url as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final String? name;

  final String? url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon$species) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon$species
    on Query$pokemon$pokemon$species {
  CopyWith$Query$pokemon$pokemon$species<Query$pokemon$pokemon$species>
      get copyWith => CopyWith$Query$pokemon$pokemon$species(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemon$pokemon$species<TRes> {
  factory CopyWith$Query$pokemon$pokemon$species(
    Query$pokemon$pokemon$species instance,
    TRes Function(Query$pokemon$pokemon$species) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon$species;

  factory CopyWith$Query$pokemon$pokemon$species.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon$species;

  TRes call({
    String? id,
    String? name,
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pokemon$pokemon$species<TRes>
    implements CopyWith$Query$pokemon$pokemon$species<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon$species(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon$species _instance;

  final TRes Function(Query$pokemon$pokemon$species) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon$species(
        id: id == _undefined ? _instance.id : (id as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        url: url == _undefined ? _instance.url : (url as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$pokemon$pokemon$species<TRes>
    implements CopyWith$Query$pokemon$pokemon$species<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon$species(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? url,
    String? $__typename,
  }) =>
      _res;
}

class Query$pokemon$pokemon$stats {
  Query$pokemon$pokemon$stats({
    this.stat,
    this.base_stat,
    this.effort,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon$stats.fromJson(Map<String, dynamic> json) {
    final l$stat = json['stat'];
    final l$base_stat = json['base_stat'];
    final l$effort = json['effort'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon$stats(
      stat: l$stat == null
          ? null
          : Query$pokemon$pokemon$stats$stat.fromJson(
              (l$stat as Map<String, dynamic>)),
      base_stat: (l$base_stat as int?),
      effort: (l$effort as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$pokemon$pokemon$stats$stat? stat;

  final int? base_stat;

  final int? effort;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$stat = stat;
    _resultData['stat'] = l$stat?.toJson();
    final l$base_stat = base_stat;
    _resultData['base_stat'] = l$base_stat;
    final l$effort = effort;
    _resultData['effort'] = l$effort;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$stat = stat;
    final l$base_stat = base_stat;
    final l$effort = effort;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$stat,
      l$base_stat,
      l$effort,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon$stats) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stat = stat;
    final lOther$stat = other.stat;
    if (l$stat != lOther$stat) {
      return false;
    }
    final l$base_stat = base_stat;
    final lOther$base_stat = other.base_stat;
    if (l$base_stat != lOther$base_stat) {
      return false;
    }
    final l$effort = effort;
    final lOther$effort = other.effort;
    if (l$effort != lOther$effort) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon$stats
    on Query$pokemon$pokemon$stats {
  CopyWith$Query$pokemon$pokemon$stats<Query$pokemon$pokemon$stats>
      get copyWith => CopyWith$Query$pokemon$pokemon$stats(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemon$pokemon$stats<TRes> {
  factory CopyWith$Query$pokemon$pokemon$stats(
    Query$pokemon$pokemon$stats instance,
    TRes Function(Query$pokemon$pokemon$stats) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon$stats;

  factory CopyWith$Query$pokemon$pokemon$stats.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon$stats;

  TRes call({
    Query$pokemon$pokemon$stats$stat? stat,
    int? base_stat,
    int? effort,
    String? $__typename,
  });
  CopyWith$Query$pokemon$pokemon$stats$stat<TRes> get stat;
}

class _CopyWithImpl$Query$pokemon$pokemon$stats<TRes>
    implements CopyWith$Query$pokemon$pokemon$stats<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon$stats(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon$stats _instance;

  final TRes Function(Query$pokemon$pokemon$stats) _then;

  static const _undefined = {};

  TRes call({
    Object? stat = _undefined,
    Object? base_stat = _undefined,
    Object? effort = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon$stats(
        stat: stat == _undefined
            ? _instance.stat
            : (stat as Query$pokemon$pokemon$stats$stat?),
        base_stat:
            base_stat == _undefined ? _instance.base_stat : (base_stat as int?),
        effort: effort == _undefined ? _instance.effort : (effort as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$pokemon$pokemon$stats$stat<TRes> get stat {
    final local$stat = _instance.stat;
    return local$stat == null
        ? CopyWith$Query$pokemon$pokemon$stats$stat.stub(_then(_instance))
        : CopyWith$Query$pokemon$pokemon$stats$stat(
            local$stat, (e) => call(stat: e));
  }
}

class _CopyWithStubImpl$Query$pokemon$pokemon$stats<TRes>
    implements CopyWith$Query$pokemon$pokemon$stats<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon$stats(this._res);

  TRes _res;

  call({
    Query$pokemon$pokemon$stats$stat? stat,
    int? base_stat,
    int? effort,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$pokemon$pokemon$stats$stat<TRes> get stat =>
      CopyWith$Query$pokemon$pokemon$stats$stat.stub(_res);
}

class Query$pokemon$pokemon$stats$stat {
  Query$pokemon$pokemon$stats$stat({
    this.name,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon$stats$stat.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon$stats$stat(
      name: (l$name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon$stats$stat) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon$stats$stat
    on Query$pokemon$pokemon$stats$stat {
  CopyWith$Query$pokemon$pokemon$stats$stat<Query$pokemon$pokemon$stats$stat>
      get copyWith => CopyWith$Query$pokemon$pokemon$stats$stat(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemon$pokemon$stats$stat<TRes> {
  factory CopyWith$Query$pokemon$pokemon$stats$stat(
    Query$pokemon$pokemon$stats$stat instance,
    TRes Function(Query$pokemon$pokemon$stats$stat) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon$stats$stat;

  factory CopyWith$Query$pokemon$pokemon$stats$stat.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon$stats$stat;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pokemon$pokemon$stats$stat<TRes>
    implements CopyWith$Query$pokemon$pokemon$stats$stat<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon$stats$stat(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon$stats$stat _instance;

  final TRes Function(Query$pokemon$pokemon$stats$stat) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon$stats$stat(
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$pokemon$pokemon$stats$stat<TRes>
    implements CopyWith$Query$pokemon$pokemon$stats$stat<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon$stats$stat(this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$pokemon$pokemon$moves {
  Query$pokemon$pokemon$moves({
    this.move,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon$moves.fromJson(Map<String, dynamic> json) {
    final l$move = json['move'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon$moves(
      move: l$move == null
          ? null
          : Query$pokemon$pokemon$moves$move.fromJson(
              (l$move as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$pokemon$pokemon$moves$move? move;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$move = move;
    _resultData['move'] = l$move?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$move = move;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$move,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon$moves) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$move = move;
    final lOther$move = other.move;
    if (l$move != lOther$move) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon$moves
    on Query$pokemon$pokemon$moves {
  CopyWith$Query$pokemon$pokemon$moves<Query$pokemon$pokemon$moves>
      get copyWith => CopyWith$Query$pokemon$pokemon$moves(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemon$pokemon$moves<TRes> {
  factory CopyWith$Query$pokemon$pokemon$moves(
    Query$pokemon$pokemon$moves instance,
    TRes Function(Query$pokemon$pokemon$moves) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon$moves;

  factory CopyWith$Query$pokemon$pokemon$moves.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon$moves;

  TRes call({
    Query$pokemon$pokemon$moves$move? move,
    String? $__typename,
  });
  CopyWith$Query$pokemon$pokemon$moves$move<TRes> get move;
}

class _CopyWithImpl$Query$pokemon$pokemon$moves<TRes>
    implements CopyWith$Query$pokemon$pokemon$moves<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon$moves(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon$moves _instance;

  final TRes Function(Query$pokemon$pokemon$moves) _then;

  static const _undefined = {};

  TRes call({
    Object? move = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon$moves(
        move: move == _undefined
            ? _instance.move
            : (move as Query$pokemon$pokemon$moves$move?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$pokemon$pokemon$moves$move<TRes> get move {
    final local$move = _instance.move;
    return local$move == null
        ? CopyWith$Query$pokemon$pokemon$moves$move.stub(_then(_instance))
        : CopyWith$Query$pokemon$pokemon$moves$move(
            local$move, (e) => call(move: e));
  }
}

class _CopyWithStubImpl$Query$pokemon$pokemon$moves<TRes>
    implements CopyWith$Query$pokemon$pokemon$moves<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon$moves(this._res);

  TRes _res;

  call({
    Query$pokemon$pokemon$moves$move? move,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$pokemon$pokemon$moves$move<TRes> get move =>
      CopyWith$Query$pokemon$pokemon$moves$move.stub(_res);
}

class Query$pokemon$pokemon$moves$move {
  Query$pokemon$pokemon$moves$move({
    this.name,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon$moves$move.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon$moves$move(
      name: (l$name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon$moves$move) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon$moves$move
    on Query$pokemon$pokemon$moves$move {
  CopyWith$Query$pokemon$pokemon$moves$move<Query$pokemon$pokemon$moves$move>
      get copyWith => CopyWith$Query$pokemon$pokemon$moves$move(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemon$pokemon$moves$move<TRes> {
  factory CopyWith$Query$pokemon$pokemon$moves$move(
    Query$pokemon$pokemon$moves$move instance,
    TRes Function(Query$pokemon$pokemon$moves$move) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon$moves$move;

  factory CopyWith$Query$pokemon$pokemon$moves$move.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon$moves$move;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pokemon$pokemon$moves$move<TRes>
    implements CopyWith$Query$pokemon$pokemon$moves$move<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon$moves$move(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon$moves$move _instance;

  final TRes Function(Query$pokemon$pokemon$moves$move) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon$moves$move(
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$pokemon$pokemon$moves$move<TRes>
    implements CopyWith$Query$pokemon$pokemon$moves$move<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon$moves$move(this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$pokemon$pokemon$abilities {
  Query$pokemon$pokemon$abilities({
    this.ability,
    this.slot,
    this.is_hidden,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon$abilities.fromJson(Map<String, dynamic> json) {
    final l$ability = json['ability'];
    final l$slot = json['slot'];
    final l$is_hidden = json['is_hidden'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon$abilities(
      ability: l$ability == null
          ? null
          : Query$pokemon$pokemon$abilities$ability.fromJson(
              (l$ability as Map<String, dynamic>)),
      slot: (l$slot as int?),
      is_hidden: (l$is_hidden as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$pokemon$pokemon$abilities$ability? ability;

  final int? slot;

  final bool? is_hidden;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$ability = ability;
    _resultData['ability'] = l$ability?.toJson();
    final l$slot = slot;
    _resultData['slot'] = l$slot;
    final l$is_hidden = is_hidden;
    _resultData['is_hidden'] = l$is_hidden;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$ability = ability;
    final l$slot = slot;
    final l$is_hidden = is_hidden;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$ability,
      l$slot,
      l$is_hidden,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon$abilities) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$ability = ability;
    final lOther$ability = other.ability;
    if (l$ability != lOther$ability) {
      return false;
    }
    final l$slot = slot;
    final lOther$slot = other.slot;
    if (l$slot != lOther$slot) {
      return false;
    }
    final l$is_hidden = is_hidden;
    final lOther$is_hidden = other.is_hidden;
    if (l$is_hidden != lOther$is_hidden) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon$abilities
    on Query$pokemon$pokemon$abilities {
  CopyWith$Query$pokemon$pokemon$abilities<Query$pokemon$pokemon$abilities>
      get copyWith => CopyWith$Query$pokemon$pokemon$abilities(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemon$pokemon$abilities<TRes> {
  factory CopyWith$Query$pokemon$pokemon$abilities(
    Query$pokemon$pokemon$abilities instance,
    TRes Function(Query$pokemon$pokemon$abilities) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon$abilities;

  factory CopyWith$Query$pokemon$pokemon$abilities.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon$abilities;

  TRes call({
    Query$pokemon$pokemon$abilities$ability? ability,
    int? slot,
    bool? is_hidden,
    String? $__typename,
  });
  CopyWith$Query$pokemon$pokemon$abilities$ability<TRes> get ability;
}

class _CopyWithImpl$Query$pokemon$pokemon$abilities<TRes>
    implements CopyWith$Query$pokemon$pokemon$abilities<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon$abilities(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon$abilities _instance;

  final TRes Function(Query$pokemon$pokemon$abilities) _then;

  static const _undefined = {};

  TRes call({
    Object? ability = _undefined,
    Object? slot = _undefined,
    Object? is_hidden = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon$abilities(
        ability: ability == _undefined
            ? _instance.ability
            : (ability as Query$pokemon$pokemon$abilities$ability?),
        slot: slot == _undefined ? _instance.slot : (slot as int?),
        is_hidden: is_hidden == _undefined
            ? _instance.is_hidden
            : (is_hidden as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$pokemon$pokemon$abilities$ability<TRes> get ability {
    final local$ability = _instance.ability;
    return local$ability == null
        ? CopyWith$Query$pokemon$pokemon$abilities$ability.stub(
            _then(_instance))
        : CopyWith$Query$pokemon$pokemon$abilities$ability(
            local$ability, (e) => call(ability: e));
  }
}

class _CopyWithStubImpl$Query$pokemon$pokemon$abilities<TRes>
    implements CopyWith$Query$pokemon$pokemon$abilities<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon$abilities(this._res);

  TRes _res;

  call({
    Query$pokemon$pokemon$abilities$ability? ability,
    int? slot,
    bool? is_hidden,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$pokemon$pokemon$abilities$ability<TRes> get ability =>
      CopyWith$Query$pokemon$pokemon$abilities$ability.stub(_res);
}

class Query$pokemon$pokemon$abilities$ability {
  Query$pokemon$pokemon$abilities$ability({
    this.name,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon$abilities$ability.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon$abilities$ability(
      name: (l$name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon$abilities$ability) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon$abilities$ability
    on Query$pokemon$pokemon$abilities$ability {
  CopyWith$Query$pokemon$pokemon$abilities$ability<
          Query$pokemon$pokemon$abilities$ability>
      get copyWith => CopyWith$Query$pokemon$pokemon$abilities$ability(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemon$pokemon$abilities$ability<TRes> {
  factory CopyWith$Query$pokemon$pokemon$abilities$ability(
    Query$pokemon$pokemon$abilities$ability instance,
    TRes Function(Query$pokemon$pokemon$abilities$ability) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon$abilities$ability;

  factory CopyWith$Query$pokemon$pokemon$abilities$ability.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon$abilities$ability;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pokemon$pokemon$abilities$ability<TRes>
    implements CopyWith$Query$pokemon$pokemon$abilities$ability<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon$abilities$ability(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon$abilities$ability _instance;

  final TRes Function(Query$pokemon$pokemon$abilities$ability) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon$abilities$ability(
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$pokemon$pokemon$abilities$ability<TRes>
    implements CopyWith$Query$pokemon$pokemon$abilities$ability<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon$abilities$ability(this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$pokemon$pokemon$types {
  Query$pokemon$pokemon$types({
    this.type,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon$types.fromJson(Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon$types(
      type: l$type == null
          ? null
          : Query$pokemon$pokemon$types$type.fromJson(
              (l$type as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$pokemon$pokemon$types$type? type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = l$type?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon$types) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon$types
    on Query$pokemon$pokemon$types {
  CopyWith$Query$pokemon$pokemon$types<Query$pokemon$pokemon$types>
      get copyWith => CopyWith$Query$pokemon$pokemon$types(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemon$pokemon$types<TRes> {
  factory CopyWith$Query$pokemon$pokemon$types(
    Query$pokemon$pokemon$types instance,
    TRes Function(Query$pokemon$pokemon$types) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon$types;

  factory CopyWith$Query$pokemon$pokemon$types.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon$types;

  TRes call({
    Query$pokemon$pokemon$types$type? type,
    String? $__typename,
  });
  CopyWith$Query$pokemon$pokemon$types$type<TRes> get type;
}

class _CopyWithImpl$Query$pokemon$pokemon$types<TRes>
    implements CopyWith$Query$pokemon$pokemon$types<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon$types(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon$types _instance;

  final TRes Function(Query$pokemon$pokemon$types) _then;

  static const _undefined = {};

  TRes call({
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon$types(
        type: type == _undefined
            ? _instance.type
            : (type as Query$pokemon$pokemon$types$type?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$pokemon$pokemon$types$type<TRes> get type {
    final local$type = _instance.type;
    return local$type == null
        ? CopyWith$Query$pokemon$pokemon$types$type.stub(_then(_instance))
        : CopyWith$Query$pokemon$pokemon$types$type(
            local$type, (e) => call(type: e));
  }
}

class _CopyWithStubImpl$Query$pokemon$pokemon$types<TRes>
    implements CopyWith$Query$pokemon$pokemon$types<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon$types(this._res);

  TRes _res;

  call({
    Query$pokemon$pokemon$types$type? type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$pokemon$pokemon$types$type<TRes> get type =>
      CopyWith$Query$pokemon$pokemon$types$type.stub(_res);
}

class Query$pokemon$pokemon$types$type {
  Query$pokemon$pokemon$types$type({
    this.name,
    required this.$__typename,
  });

  factory Query$pokemon$pokemon$types$type.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$pokemon$pokemon$types$type(
      name: (l$name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemon$pokemon$types$type) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemon$pokemon$types$type
    on Query$pokemon$pokemon$types$type {
  CopyWith$Query$pokemon$pokemon$types$type<Query$pokemon$pokemon$types$type>
      get copyWith => CopyWith$Query$pokemon$pokemon$types$type(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemon$pokemon$types$type<TRes> {
  factory CopyWith$Query$pokemon$pokemon$types$type(
    Query$pokemon$pokemon$types$type instance,
    TRes Function(Query$pokemon$pokemon$types$type) then,
  ) = _CopyWithImpl$Query$pokemon$pokemon$types$type;

  factory CopyWith$Query$pokemon$pokemon$types$type.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemon$pokemon$types$type;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pokemon$pokemon$types$type<TRes>
    implements CopyWith$Query$pokemon$pokemon$types$type<TRes> {
  _CopyWithImpl$Query$pokemon$pokemon$types$type(
    this._instance,
    this._then,
  );

  final Query$pokemon$pokemon$types$type _instance;

  final TRes Function(Query$pokemon$pokemon$types$type) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemon$pokemon$types$type(
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$pokemon$pokemon$types$type<TRes>
    implements CopyWith$Query$pokemon$pokemon$types$type<TRes> {
  _CopyWithStubImpl$Query$pokemon$pokemon$types$type(this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$pokemons {
  factory Variables$Query$pokemons({
    int? limit,
    int? offset,
  }) =>
      Variables$Query$pokemons._({
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$pokemons._(this._$data);

  factory Variables$Query$pokemons.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$pokemons._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    return result$data;
  }

  CopyWith$Variables$Query$pokemons<Variables$Query$pokemons> get copyWith =>
      CopyWith$Variables$Query$pokemons(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$pokemons) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$pokemons<TRes> {
  factory CopyWith$Variables$Query$pokemons(
    Variables$Query$pokemons instance,
    TRes Function(Variables$Query$pokemons) then,
  ) = _CopyWithImpl$Variables$Query$pokemons;

  factory CopyWith$Variables$Query$pokemons.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$pokemons;

  TRes call({
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$pokemons<TRes>
    implements CopyWith$Variables$Query$pokemons<TRes> {
  _CopyWithImpl$Variables$Query$pokemons(
    this._instance,
    this._then,
  );

  final Variables$Query$pokemons _instance;

  final TRes Function(Variables$Query$pokemons) _then;

  static const _undefined = {};

  TRes call({
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$pokemons._({
        ..._instance._$data,
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$pokemons<TRes>
    implements CopyWith$Variables$Query$pokemons<TRes> {
  _CopyWithStubImpl$Variables$Query$pokemons(this._res);

  TRes _res;

  call({
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$pokemons {
  Query$pokemons({
    this.pokemons,
    required this.$__typename,
  });

  factory Query$pokemons.fromJson(Map<String, dynamic> json) {
    final l$pokemons = json['pokemons'];
    final l$$__typename = json['__typename'];
    return Query$pokemons(
      pokemons: l$pokemons == null
          ? null
          : Query$pokemons$pokemons.fromJson(
              (l$pokemons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$pokemons$pokemons? pokemons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pokemons = pokemons;
    _resultData['pokemons'] = l$pokemons?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pokemons = pokemons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pokemons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemons) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$pokemons = pokemons;
    final lOther$pokemons = other.pokemons;
    if (l$pokemons != lOther$pokemons) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemons on Query$pokemons {
  CopyWith$Query$pokemons<Query$pokemons> get copyWith =>
      CopyWith$Query$pokemons(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$pokemons<TRes> {
  factory CopyWith$Query$pokemons(
    Query$pokemons instance,
    TRes Function(Query$pokemons) then,
  ) = _CopyWithImpl$Query$pokemons;

  factory CopyWith$Query$pokemons.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemons;

  TRes call({
    Query$pokemons$pokemons? pokemons,
    String? $__typename,
  });
  CopyWith$Query$pokemons$pokemons<TRes> get pokemons;
}

class _CopyWithImpl$Query$pokemons<TRes>
    implements CopyWith$Query$pokemons<TRes> {
  _CopyWithImpl$Query$pokemons(
    this._instance,
    this._then,
  );

  final Query$pokemons _instance;

  final TRes Function(Query$pokemons) _then;

  static const _undefined = {};

  TRes call({
    Object? pokemons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemons(
        pokemons: pokemons == _undefined
            ? _instance.pokemons
            : (pokemons as Query$pokemons$pokemons?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$pokemons$pokemons<TRes> get pokemons {
    final local$pokemons = _instance.pokemons;
    return local$pokemons == null
        ? CopyWith$Query$pokemons$pokemons.stub(_then(_instance))
        : CopyWith$Query$pokemons$pokemons(
            local$pokemons, (e) => call(pokemons: e));
  }
}

class _CopyWithStubImpl$Query$pokemons<TRes>
    implements CopyWith$Query$pokemons<TRes> {
  _CopyWithStubImpl$Query$pokemons(this._res);

  TRes _res;

  call({
    Query$pokemons$pokemons? pokemons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$pokemons$pokemons<TRes> get pokemons =>
      CopyWith$Query$pokemons$pokemons.stub(_res);
}

const documentNodeQuerypokemons = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'pokemons'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'pokemons'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'count'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'next'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'previous'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'nextOffset'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'prevOffset'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'results'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'url'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$pokemons _parserFn$Query$pokemons(Map<String, dynamic> data) =>
    Query$pokemons.fromJson(data);

class Options$Query$pokemons extends graphql.QueryOptions<Query$pokemons> {
  Options$Query$pokemons({
    String? operationName,
    Variables$Query$pokemons? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerypokemons,
          parserFn: _parserFn$Query$pokemons,
        );
}

class WatchOptions$Query$pokemons
    extends graphql.WatchQueryOptions<Query$pokemons> {
  WatchOptions$Query$pokemons({
    String? operationName,
    Variables$Query$pokemons? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerypokemons,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$pokemons,
        );
}

class FetchMoreOptions$Query$pokemons extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$pokemons({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$pokemons? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerypokemons,
        );
}

extension ClientExtension$Query$pokemons on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$pokemons>> query$pokemons(
          [Options$Query$pokemons? options]) async =>
      await this.query(options ?? Options$Query$pokemons());
  graphql.ObservableQuery<Query$pokemons> watchQuery$pokemons(
          [WatchOptions$Query$pokemons? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$pokemons());
  void writeQuery$pokemons({
    required Query$pokemons data,
    Variables$Query$pokemons? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerypokemons),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$pokemons? readQuery$pokemons({
    Variables$Query$pokemons? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerypokemons),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$pokemons.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$pokemons> useQuery$pokemons(
        [Options$Query$pokemons? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$pokemons());
graphql.ObservableQuery<Query$pokemons> useWatchQuery$pokemons(
        [WatchOptions$Query$pokemons? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$pokemons());

class Query$pokemons$Widget extends graphql_flutter.Query<Query$pokemons> {
  Query$pokemons$Widget({
    widgets.Key? key,
    Options$Query$pokemons? options,
    required graphql_flutter.QueryBuilder<Query$pokemons> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$pokemons(),
          builder: builder,
        );
}

class Query$pokemons$pokemons {
  Query$pokemons$pokemons({
    required this.count,
    this.next,
    this.previous,
    this.nextOffset,
    this.prevOffset,
    this.status,
    this.message,
    this.results,
    required this.$__typename,
  });

  factory Query$pokemons$pokemons.fromJson(Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$next = json['next'];
    final l$previous = json['previous'];
    final l$nextOffset = json['nextOffset'];
    final l$prevOffset = json['prevOffset'];
    final l$status = json['status'];
    final l$message = json['message'];
    final l$results = json['results'];
    final l$$__typename = json['__typename'];
    return Query$pokemons$pokemons(
      count: (l$count as int),
      next: (l$next as String?),
      previous: (l$previous as String?),
      nextOffset: (l$nextOffset as int?),
      prevOffset: (l$prevOffset as int?),
      status: (l$status as bool?),
      message: (l$message as String?),
      results: (l$results as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$pokemons$pokemons$results.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int count;

  final String? next;

  final String? previous;

  final int? nextOffset;

  final int? prevOffset;

  final bool? status;

  final String? message;

  final List<Query$pokemons$pokemons$results?>? results;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$count = count;
    _resultData['count'] = l$count;
    final l$next = next;
    _resultData['next'] = l$next;
    final l$previous = previous;
    _resultData['previous'] = l$previous;
    final l$nextOffset = nextOffset;
    _resultData['nextOffset'] = l$nextOffset;
    final l$prevOffset = prevOffset;
    _resultData['prevOffset'] = l$prevOffset;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$results = results;
    _resultData['results'] = l$results?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$count = count;
    final l$next = next;
    final l$previous = previous;
    final l$nextOffset = nextOffset;
    final l$prevOffset = prevOffset;
    final l$status = status;
    final l$message = message;
    final l$results = results;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$count,
      l$next,
      l$previous,
      l$nextOffset,
      l$prevOffset,
      l$status,
      l$message,
      l$results == null ? null : Object.hashAll(l$results.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemons$pokemons) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (l$count != lOther$count) {
      return false;
    }
    final l$next = next;
    final lOther$next = other.next;
    if (l$next != lOther$next) {
      return false;
    }
    final l$previous = previous;
    final lOther$previous = other.previous;
    if (l$previous != lOther$previous) {
      return false;
    }
    final l$nextOffset = nextOffset;
    final lOther$nextOffset = other.nextOffset;
    if (l$nextOffset != lOther$nextOffset) {
      return false;
    }
    final l$prevOffset = prevOffset;
    final lOther$prevOffset = other.prevOffset;
    if (l$prevOffset != lOther$prevOffset) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$results = results;
    final lOther$results = other.results;
    if (l$results != null && lOther$results != null) {
      if (l$results.length != lOther$results.length) {
        return false;
      }
      for (int i = 0; i < l$results.length; i++) {
        final l$results$entry = l$results[i];
        final lOther$results$entry = lOther$results[i];
        if (l$results$entry != lOther$results$entry) {
          return false;
        }
      }
    } else if (l$results != lOther$results) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemons$pokemons on Query$pokemons$pokemons {
  CopyWith$Query$pokemons$pokemons<Query$pokemons$pokemons> get copyWith =>
      CopyWith$Query$pokemons$pokemons(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$pokemons$pokemons<TRes> {
  factory CopyWith$Query$pokemons$pokemons(
    Query$pokemons$pokemons instance,
    TRes Function(Query$pokemons$pokemons) then,
  ) = _CopyWithImpl$Query$pokemons$pokemons;

  factory CopyWith$Query$pokemons$pokemons.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemons$pokemons;

  TRes call({
    int? count,
    String? next,
    String? previous,
    int? nextOffset,
    int? prevOffset,
    bool? status,
    String? message,
    List<Query$pokemons$pokemons$results?>? results,
    String? $__typename,
  });
  TRes results(
      Iterable<Query$pokemons$pokemons$results?>? Function(
              Iterable<
                  CopyWith$Query$pokemons$pokemons$results<
                      Query$pokemons$pokemons$results>?>?)
          _fn);
}

class _CopyWithImpl$Query$pokemons$pokemons<TRes>
    implements CopyWith$Query$pokemons$pokemons<TRes> {
  _CopyWithImpl$Query$pokemons$pokemons(
    this._instance,
    this._then,
  );

  final Query$pokemons$pokemons _instance;

  final TRes Function(Query$pokemons$pokemons) _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? next = _undefined,
    Object? previous = _undefined,
    Object? nextOffset = _undefined,
    Object? prevOffset = _undefined,
    Object? status = _undefined,
    Object? message = _undefined,
    Object? results = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemons$pokemons(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        next: next == _undefined ? _instance.next : (next as String?),
        previous:
            previous == _undefined ? _instance.previous : (previous as String?),
        nextOffset: nextOffset == _undefined
            ? _instance.nextOffset
            : (nextOffset as int?),
        prevOffset: prevOffset == _undefined
            ? _instance.prevOffset
            : (prevOffset as int?),
        status: status == _undefined ? _instance.status : (status as bool?),
        message:
            message == _undefined ? _instance.message : (message as String?),
        results: results == _undefined
            ? _instance.results
            : (results as List<Query$pokemons$pokemons$results?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes results(
          Iterable<Query$pokemons$pokemons$results?>? Function(
                  Iterable<
                      CopyWith$Query$pokemons$pokemons$results<
                          Query$pokemons$pokemons$results>?>?)
              _fn) =>
      call(
          results: _fn(_instance.results?.map((e) => e == null
              ? null
              : CopyWith$Query$pokemons$pokemons$results(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$pokemons$pokemons<TRes>
    implements CopyWith$Query$pokemons$pokemons<TRes> {
  _CopyWithStubImpl$Query$pokemons$pokemons(this._res);

  TRes _res;

  call({
    int? count,
    String? next,
    String? previous,
    int? nextOffset,
    int? prevOffset,
    bool? status,
    String? message,
    List<Query$pokemons$pokemons$results?>? results,
    String? $__typename,
  }) =>
      _res;
  results(_fn) => _res;
}

class Query$pokemons$pokemons$results {
  Query$pokemons$pokemons$results({
    this.id,
    this.url,
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$pokemons$pokemons$results.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$url = json['url'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$pokemons$pokemons$results(
      id: (l$id as int?),
      url: (l$url as String?),
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? id;

  final String? url;

  final String? name;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$url = url;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$url,
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pokemons$pokemons$results) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$pokemons$pokemons$results
    on Query$pokemons$pokemons$results {
  CopyWith$Query$pokemons$pokemons$results<Query$pokemons$pokemons$results>
      get copyWith => CopyWith$Query$pokemons$pokemons$results(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pokemons$pokemons$results<TRes> {
  factory CopyWith$Query$pokemons$pokemons$results(
    Query$pokemons$pokemons$results instance,
    TRes Function(Query$pokemons$pokemons$results) then,
  ) = _CopyWithImpl$Query$pokemons$pokemons$results;

  factory CopyWith$Query$pokemons$pokemons$results.stub(TRes res) =
      _CopyWithStubImpl$Query$pokemons$pokemons$results;

  TRes call({
    int? id,
    String? url,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pokemons$pokemons$results<TRes>
    implements CopyWith$Query$pokemons$pokemons$results<TRes> {
  _CopyWithImpl$Query$pokemons$pokemons$results(
    this._instance,
    this._then,
  );

  final Query$pokemons$pokemons$results _instance;

  final TRes Function(Query$pokemons$pokemons$results) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? url = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemons$pokemons$results(
        id: id == _undefined ? _instance.id : (id as int?),
        url: url == _undefined ? _instance.url : (url as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$pokemons$pokemons$results<TRes>
    implements CopyWith$Query$pokemons$pokemons$results<TRes> {
  _CopyWithStubImpl$Query$pokemons$pokemons$results(this._res);

  TRes _res;

  call({
    int? id,
    String? url,
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

const possibleTypesMap = {};
