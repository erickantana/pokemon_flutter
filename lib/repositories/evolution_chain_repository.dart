import 'package:hive_flutter/hive_flutter.dart';

import '../podo/evolution_chain.dart';
import 'repository_box_name.dart';

class EvolutionChainRepository {
  static Future<EvolutionChain?> getEvolutionChain(String evolutionChainUrl) async {
    LazyBox box = await Hive.openLazyBox<EvolutionChain>(RepositoryBoxName.evolutionChain);
    return await box.get(evolutionChainUrl);
  }

  static Future<void> setEvolutionChain(String evolutionChainUrl, EvolutionChain evolutionChain) async {
    LazyBox box = await Hive.openLazyBox<EvolutionChain>(RepositoryBoxName.evolutionChain);
    await box.put(evolutionChainUrl, evolutionChain);
  }
}
