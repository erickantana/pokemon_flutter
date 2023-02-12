abstract class Env {
  static Env? _instance;

  static Env get instance => _instance ?? (_instance = _env);

  static Env get _env {
    final environments = {
      "dev": _Development(),
      "prod": _Production(),
      "test": _Testing(),
    };
    const arg = String.fromEnvironment("env");
    return environments[arg] ?? _Development();
  }

  abstract final String _endPoint;
  static String get endPoint => instance._endPoint;
}

class _Production extends Env {
  @override
  final String _endPoint = "https://graphql-pokeapi.graphcdn.app/";
}

class _Development extends Env {
  @override
  final String _endPoint = "https://graphql-pokeapi.graphcdn.app/";
}

class _Testing extends Env {
  @override
  final String _endPoint = "https://graphql-pokeapi.graphcdn.app/";
}
