import 'package:hive_flutter/hive_flutter.dart';

import '../podo/species.dart';
import 'repository_box_name.dart';

class SpeciesRepository {
  static Future<Species?> getSpecies(String? speciesUrl) async {
    if (speciesUrl == null) return null;

    LazyBox box = await Hive.openLazyBox<Species>(RepositoryBoxName.species);
    return await box.get(speciesUrl);
  }

  static Future<void> setSpecies(String? speciesUrl, Species species) async {
    if (speciesUrl == null) return;

    LazyBox box = await Hive.openLazyBox<Species>(RepositoryBoxName.species);
    await box.put(speciesUrl, species);
  }
}
