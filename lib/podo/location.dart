import 'package:hive/hive.dart';

import 'type_ids.dart';

part 'location.g.dart';

@HiveType(typeId: TypeId.location)
class Location {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? url;

  @override
  String toString() {
    return <String, dynamic>{
      "name": name,
      "url": url,
    }.toString();
  }

  Location(this.name, this.url);

  static Location? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Location(json["name"], json["url"]);
  }
}
