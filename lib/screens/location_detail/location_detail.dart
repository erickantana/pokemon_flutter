import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/string_extensions.dart';
import '../../podo/encounter.dart';
import '../../podo/encounter_detail.dart';
import '../../podo/encounter_version.dart';
import '../../widgets/key_value_pair.dart';

class LocationDetail extends StatelessWidget {
  final Encounter encounter;
  const LocationDetail({Key? key, required this.encounter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => context.pop(),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              const Text(
                "Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      encounter.location?.name?.unhypenated.capitalized ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    for (final encounterVersion in encounter.encounterVersions ?? <EncounterVersion>[])
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Version: ${encounterVersion?.name.capitalized}",
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Max Chance: ${encounterVersion?.maxChance?.toString() ?? ""}",
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Divider(),
                              LocationEncounterDetail(encounterDetails: encounterVersion?.encounterDetails),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationEncounterDetail extends StatelessWidget {
  final List<EncounterDetail?>? encounterDetails;
  const LocationEncounterDetail({Key? key, this.encounterDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final encounters = encounterDetails;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (encounters != null)
          for (int i = 0; i < encounters.length; i++) ...[
            if (i > 0) const Divider(),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              "Encounter #${i + 1}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 4)),
            Row(
              children: [
                Expanded(
                  child: KeyValuePair(
                    stringKey: "Min. Level",
                    stringValue: encounters[i]?.minLevel?.toString(),
                  ),
                ),
                Expanded(
                  child: KeyValuePair(
                    stringKey: "Chance",
                    stringValue: encounters[i]?.chance?.toString(),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Row(
              children: [
                Expanded(
                  child: KeyValuePair(
                    stringKey: "Max. Level",
                    stringValue: encounters[i]?.maxLevel?.toString(),
                  ),
                ),
                Expanded(
                  child: KeyValuePair(
                    stringKey: "Method",
                    stringValue: encounters[i]?.method.unhypenated.capitalized,
                  ),
                ),
              ],
            ),
            EncounterConditions(conditions: encounters[i]?.conditions),
          ],
      ],
    );
  }
}

class EncounterConditions extends StatelessWidget {
  final List<String>? conditions;
  const EncounterConditions({Key? key, this.conditions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final encounterConditions = conditions;

    if (encounterConditions == null || encounterConditions.isEmpty) return Container();
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Conditions:",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          for (final condition in encounterConditions)
            Text(
              "* ${condition.unhypenated.capitalized}",
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
