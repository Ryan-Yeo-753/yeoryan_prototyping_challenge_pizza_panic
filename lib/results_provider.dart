import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prototyping_challenge_pizza_panic/match_information.dart';
import 'package:prototyping_challenge_pizza_panic/data_collection.dart';
import 'package:prototyping_challenge_pizza_panic/match_end.dart';

class DataSavings extends Notifier<ScoutingData> {

  @override
  ScoutingData build() => ScoutingData(
    MatchInformationData(
      '', 1, 0, 0, 0, false, false, 0, 0
    ),
    DataCollectionData(
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    ),
    MatchEndData(
      false, false, ''
    )
  );

  void saveData() {
    // Saves the current MatchInformationData, DataCollectionData, and MatchEndData
    // Updates the state of the provider using the new values
  }
}

final dataSavingsNotifierProvider = NotifierProvider<DataSavings, ScoutingData>(
  DataSavings.new,
);

class ScoutingData {
  MatchInformationData matchInformation;
  DataCollectionData generalData;
  MatchEndData additionalData;

  ScoutingData(this.matchInformation, this.generalData, this.additionalData);

  static Map<String, dynamic> toMap(ScoutingData data) {
    return <String, ScoutingData>{'data': data};
  }
}