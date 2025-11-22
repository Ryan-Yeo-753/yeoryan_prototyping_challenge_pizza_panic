import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyxx/nyxx.dart';

import 'package:prototyping_challenge_pizza_panic/match_information.dart';
import 'package:prototyping_challenge_pizza_panic/data_collection.dart';
import 'package:prototyping_challenge_pizza_panic/match_end.dart';

class DataSavings extends Notifier<ScoutingData> {
  @override
  ScoutingData build() {
    final matchInformationDatabase = ref.read(matchInformationDataSavingsProvider);
    final dataCollectionDatabase = ref.read(dataCollectionDataSavingsProvider);
    final matchEndDatabase = ref.read(matchEndDataSavingsProvider);
    return ScoutingData(
      MatchInformationData(
        matchInformationDatabase.teamName,
        matchInformationDatabase.matchNumber,
        matchInformationDatabase.totalScore,
        matchInformationDatabase.summativePoints,
        matchInformationDatabase.summativePenalties,
        matchInformationDatabase.burnedMotor,
        matchInformationDatabase.detachedMechanism,
        matchInformationDatabase.malfunctionNumber,
        matchInformationDatabase.malfunctionPenalty,
      ),
      DataCollectionData(
        dataCollectionDatabase.totalPizzasScored,
        dataCollectionDatabase.deliveryTrayPizzas,
        dataCollectionDatabase.deliveryTrayPoints,
        dataCollectionDatabase.ovenColumnPizzas,
        dataCollectionDatabase.ovenColumnPoints,
        dataCollectionDatabase.deliveryHatchPizzas,
        dataCollectionDatabase.deliveryHatchPoints,
        dataCollectionDatabase.comboBonuses,
        dataCollectionDatabase.comboBonusPoints,
        dataCollectionDatabase.ovenOverrides,
        dataCollectionDatabase.ovenOverridePoints,
        dataCollectionDatabase.launchDistance,
        dataCollectionDatabase.launchPoints,
      ),
      MatchEndData(
        matchEndDatabase.humanBoundaryCross,
        matchEndDatabase.robotBoundaryCross,
        matchEndDatabase.notes,
      ),
    );
  }

  void saveData() async {
    state = state.copyWith(
      matchInformation: state.matchInformation,
      generalData: state.generalData,
      additionalData: state.additionalData
    );

    final client = await Nyxx.connectGateway('',
      GatewayIntents.allUnprivileged,
    );

    final bot = await client.users.fetchCurrentUser();

    client.onMessageCreate.listen((event) async {
      if (event.mentions.contains(bot)) {
        await event.message.channel.sendMessage(MessageBuilder(
          content:
          '${state.matchInformation}\n'
          '${state.generalData}\n'
          '${state.additionalData}'
        ));
      }
    });

    client.onReady.listen((_) {
      print("Bot is now online.");
    });
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
  ScoutingData copyWith({
    MatchInformationData? matchInformation,
    DataCollectionData? generalData,
    MatchEndData? additionalData,
  }) {
    return ScoutingData(
     matchInformation ?? this.matchInformation,
     generalData ?? this.generalData,
     additionalData ?? this.additionalData
    );
  }
}