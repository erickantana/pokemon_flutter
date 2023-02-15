import 'package:flutter/material.dart';

import '../../../extensions/string_extensions.dart';
import '../../../podo/stat.dart';

class PokemonStat extends StatelessWidget {
  final List<Stat?> stats;
  final Color? color;
  const PokemonStat({Key? key, required this.stats, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final stat in stats)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  stat?.name.unhypenated.capitalized ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold, color: color),
                ),
                Text(
                  stat?.baseStat?.toString() ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: color),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
