import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

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
    this.url,
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$pokemons$pokemons$results.fromJson(Map<String, dynamic> json) {
    final l$url = json['url'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$pokemons$pokemons$results(
      url: (l$url as String?),
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? url;

  final String? name;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$url = url;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
    Object? url = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pokemons$pokemons$results(
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
    String? url,
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

const possibleTypesMap = {};
