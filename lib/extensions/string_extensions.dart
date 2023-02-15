extension StringExt on String? {
  String get capitalized {
    return this?.split(" ").map((word) {
          if (word.isEmpty) return "";

          return "${word[0].toUpperCase()}${word.substring(1)}";
        }).join(" ") ??
        "";
  }

  String get unhypenated {
    return this?.replaceAll("-", " ") ?? "";
  }
}
