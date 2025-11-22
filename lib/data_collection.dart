import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prototyping_challenge_pizza_panic/main.dart';
import 'package:prototyping_challenge_pizza_panic/results_provider.dart';

class DataCollectionData {
  int totalPizzasScored;

  int deliveryTrayPoints;
  int ovenColumnPoints;
  int deliveryHatchPoints;

  int deliveryTrayPizzas;
  int ovenColumnPizzas;
  int deliveryHatchPizzas;

  int comboBonuses;
  int ovenOverrides;
  int comboBonusPoints;
  int ovenOverridePoints;

  int launchDistance;
  int launchPoints;

  DataCollectionData(
    this.totalPizzasScored,
    this.deliveryTrayPoints,
    this.ovenColumnPoints,
    this.deliveryHatchPoints,
    this.deliveryTrayPizzas,
    this.ovenColumnPizzas,
    this.deliveryHatchPizzas,
    this.comboBonuses,
    this.ovenOverrides,
    this.comboBonusPoints,
    this.ovenOverridePoints,
    this.launchDistance,
    this.launchPoints,
  );

  DataCollectionData copyWith({
    int? totalPizzasScored,
    int? deliveryTrayPoints,
    int? ovenColumnPoints,
    int? deliveryHatchPoints,
    int? deliveryTrayPizzas,
    int? ovenColumnPizzas,
    int? deliveryHatchPizzas,
    int? comboBonuses,
    int? ovenOverrides,
    int? comboBonusPoints,
    int? ovenOverridePoints,
    int? launchDistance,
    int? launchPoints,
  }) {
    return DataCollectionData(
      totalPizzasScored ?? this.totalPizzasScored,
      deliveryTrayPoints ?? this.deliveryTrayPoints,
      ovenColumnPoints ?? this.ovenColumnPoints,
      deliveryHatchPoints ?? this.deliveryHatchPoints,
      deliveryTrayPizzas ?? this.deliveryTrayPizzas,
      ovenColumnPizzas ?? this.ovenColumnPizzas,
      deliveryHatchPizzas ?? this.deliveryHatchPizzas,
      comboBonuses ?? this.comboBonuses,
      ovenOverrides ?? this.ovenOverrides,
      comboBonusPoints ?? this.comboBonusPoints,
      ovenOverridePoints ?? this.ovenOverridePoints,
      launchDistance ?? this.launchDistance,
      launchPoints ?? this.launchPoints,
    );
  }
}

class DataCollectionDataSavings extends Notifier<DataCollectionData> {
  @override
  DataCollectionData build() =>
      DataCollectionData(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  void addPizza(int inputLocation) {
    int newTotalPizzasScored = state.totalPizzasScored;
    int newDeliveryTrayPizzas = state.deliveryTrayPizzas;
    int newOvenColumnPizzas = state.ovenColumnPizzas;
    int newDeliveryHatchPizzas = state.deliveryHatchPizzas;
    int newDeliveryTrayPoints = state.deliveryTrayPoints;
    int newOvenColumnPoints = state.ovenColumnPoints;
    int newDeliveryHatchPoints = state.deliveryHatchPoints;

    newTotalPizzasScored++;

    switch (inputLocation) {
      case 1:
        newDeliveryTrayPizzas++;
        newDeliveryTrayPoints = (newDeliveryTrayPizzas * 3);
        break;
      case 2:
        newOvenColumnPizzas++;
        newOvenColumnPoints = (newOvenColumnPizzas * 5);
        break;
      case 3:
        newDeliveryHatchPizzas++;
        newDeliveryHatchPoints = (newDeliveryHatchPizzas * 8);
        break;
    }

    state = state.copyWith(
      totalPizzasScored: newTotalPizzasScored,
      deliveryTrayPizzas: newDeliveryTrayPizzas,
      ovenColumnPizzas: newOvenColumnPizzas,
      deliveryHatchPizzas: newDeliveryHatchPizzas,
      deliveryTrayPoints: newDeliveryTrayPoints,
      ovenColumnPoints: newOvenColumnPoints,
      deliveryHatchPoints: newDeliveryHatchPoints,
    );
  }

  void subtractPizza(int inputLocation) {
    int newTotalPizzasScored = state.totalPizzasScored;
    int newDeliveryTrayPizzas = state.deliveryTrayPizzas;
    int newOvenColumnPizzas = state.ovenColumnPizzas;
    int newDeliveryHatchPizzas = state.deliveryHatchPizzas;
    int newDeliveryTrayPoints = state.deliveryTrayPoints;
    int newOvenColumnPoints = state.ovenColumnPoints;
    int newDeliveryHatchPoints = state.deliveryHatchPoints;

    newTotalPizzasScored--;

    switch (inputLocation) {
      case 1:
        newDeliveryTrayPizzas--;
        newDeliveryTrayPoints = (newDeliveryTrayPizzas * 3);
        break;
      case 2:
        newOvenColumnPizzas--;
        newOvenColumnPoints = (newOvenColumnPizzas * 5);
        break;
      case 3:
        newDeliveryHatchPizzas--;
        newDeliveryHatchPoints = (newDeliveryHatchPizzas * 8);
        break;
    }

    state = state.copyWith(
      totalPizzasScored: newTotalPizzasScored,
      deliveryTrayPizzas: newDeliveryTrayPizzas,
      ovenColumnPizzas: newOvenColumnPizzas,
      deliveryHatchPizzas: newDeliveryHatchPizzas,
      deliveryTrayPoints: newDeliveryTrayPoints,
      ovenColumnPoints: newOvenColumnPoints,
      deliveryHatchPoints: newDeliveryHatchPoints,
    );
  }

  void addScoreBonus(int bonusType) {
    switch (bonusType) {
      case 1:
        int newComboBonuses = state.comboBonuses;
        int newComboBonusPoints = state.comboBonusPoints;
        newComboBonuses++;
        newComboBonusPoints = (newComboBonusPoints + 20);
        state = state.copyWith(comboBonuses: newComboBonuses, comboBonusPoints: newComboBonusPoints);
        break;
      case 2:
        int newOvenOverrides = state.ovenOverrides;
        int newOvenOverridePoints = state.ovenOverridePoints;
        newOvenOverrides++;
        newOvenOverridePoints = (newOvenOverridePoints + 100);
        state = state.copyWith(ovenOverrides: newOvenOverrides, ovenOverridePoints: newOvenOverridePoints);
    }
  }

  void removeScoreBonus(int bonusType) {
    switch (bonusType) {
      case 1:
        int newComboBonuses = state.comboBonuses;
        int newComboBonusPoints = state.comboBonusPoints;
        newComboBonuses--;
        newComboBonusPoints = (newComboBonusPoints - 20);
        state = state.copyWith(comboBonuses: newComboBonuses, comboBonusPoints: newComboBonusPoints);
        break;
      case 2:
        int newOvenOverrides = state.ovenOverrides;
        int newOvenOverridePoints = state.ovenOverridePoints;
        newOvenOverrides--;
        newOvenOverridePoints = (newOvenOverridePoints - 100);
        state = state.copyWith(ovenOverrides: newOvenOverrides, ovenOverridePoints: newOvenOverridePoints);
    }
  }

  void calculateLaunchPoints(int distance) {
    int newLaunchDistance = state.launchDistance;
    int newLaunchPoints = state.launchPoints;

    newLaunchDistance = distance;
    switch (distance) {
      case 0:
        newLaunchPoints = 0;
        break;
      case 5:
        newLaunchPoints = 10;
        break;
      case 10:
        newLaunchPoints = 25;
        break;
      case 15:
        newLaunchPoints = 40;
        break;
      case 20:
        newLaunchPoints = 50;
        break;
    }

    state = state.copyWith(
      launchDistance: newLaunchDistance,
      launchPoints: newLaunchPoints,
    );
  }
}

final dataCollectionDataSavingsProvider =
    NotifierProvider<DataCollectionDataSavings, DataCollectionData>(
      DataCollectionDataSavings.new,
    );

class DataCollectionPage extends ConsumerStatefulWidget {
  const DataCollectionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return DataCollectionPageState();
  }
}

class DataCollectionPageState extends ConsumerState<DataCollectionPage> {
  @override
  Widget build(BuildContext context) {
    final dataCollectionPageData = ref.watch(dataCollectionDataSavingsProvider);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DataRowContainer(
                height: 140,
                borderWidth: 2,
                padding: 20,
                child: Column(
                  children: [
                    Label(
                      label:
                          'Delivery Tray Points: ${dataCollectionPageData.deliveryTrayPoints}',
                      verticalSpace: 0,
                      horizontalSpace: 0,
                    ),
                    DataPanel(pointTypeInput: 1),
                  ],
                ),
              ),
              DataRowContainer(
                height: 140,
                borderWidth: 2,
                padding: 20,
                child: Column(
                  children: [
                    Label(
                      label:
                          'Oven Column Points: ${dataCollectionPageData.ovenColumnPoints}',
                      verticalSpace: 0,
                      horizontalSpace: 0,
                    ),
                    DataPanel(pointTypeInput: 2),
                  ],
                ),
              ),
              DataRowContainer(
                height: 140,
                borderWidth: 2,
                padding: 20,
                child: Column(
                  children: [
                    Label(
                      label:
                          'Delivery Hatch Points: ${dataCollectionPageData.deliveryHatchPoints}',
                      verticalSpace: 0,
                      horizontalSpace: 0,
                    ),
                    DataPanel(pointTypeInput: 3),
                  ],
                ),
              ),
              DataRowContainer(
                height: 140,
                borderWidth: 2,
                padding: 20,
                child: Column(
                  children: [
                    Label(
                      label:
                          'Combo Bonus Points: ${dataCollectionPageData.comboBonusPoints}',
                      verticalSpace: 0,
                      horizontalSpace: 0,
                    ),
                    TemporaryDataPanel(pointTypeInput: 1),
                  ],
                ),
              ),
              DataRowContainer(
                height: 140,
                borderWidth: 2,
                padding: 20,
                child: Column(
                  children: [
                    Label(
                      label:
                          'Oven Override Points: ${dataCollectionPageData.ovenOverridePoints}',
                      verticalSpace: 0,
                      horizontalSpace: 0,
                    ),
                    TemporaryDataPanel(pointTypeInput: 2),
                  ],
                ),
              ),

              // DataRowContainer(
              //   height: 184,
              //   borderWidth: 2,
              //   padding: 20,
              //   child: Column(
              //     children: [
              //       DataRowContainer(
              //         height: 45,
              //         borderWidth: 2,
              //         padding: 0,
              //         child: Stack(
              //           children: [
              //             Align(
              //               alignment: Alignment.centerLeft,
              //               child: Label(
              //                 label: 'Combo Bonus:',
              //                 verticalSpace: 0,
              //                 horizontalSpace: 10,
              //               ),
              //             ),
              //             Align(
              //               alignment: Alignment.centerRight,
              //               child: Label(
              //                 label:
              //                   '${dataCollectionPageData.comboBonusPoints}',
              //                 verticalSpace: 0,
              //                 horizontalSpace: 10,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       DataRowContainer(
              //         height: 45,
              //         borderWidth: 2,
              //         padding: 0,
              //         child: Stack(
              //           children: [
              //             Align(
              //               alignment: Alignment.centerLeft,
              //               child: Label(
              //                 label: 'Oven Override:',
              //                 verticalSpace: 0,
              //                 horizontalSpace: 10,
              //               ),
              //             ),
              //             Align(
              //               alignment: Alignment.centerRight,
              //               child: Label(
              //                 label:
              //                     '${dataCollectionPageData.ovenOverridePoints}',
              //                 verticalSpace: 0,
              //                 horizontalSpace: 10,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              DataRowContainer(
                height: 94,
                borderWidth: 2,
                padding: 20,
                child: Column(
                  children: [
                    DataRowContainer(
                      height: 45,
                      borderWidth: 2,
                      padding: 0,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Label(
                              label: 'Launch Distance:',
                              verticalSpace: 0,
                              horizontalSpace: 10,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: DropdownButton<int>(
                              value: dataCollectionPageData.launchDistance,
                              items: const [
                                DropdownMenuItem(value: 0, child: Text('0 ft')),
                                DropdownMenuItem(value: 5, child: Text('5 ft')),
                                DropdownMenuItem(
                                  value: 10,
                                  child: Text('10 ft'),
                                ),
                                DropdownMenuItem(
                                  value: 15,
                                  child: Text('15 ft'),
                                ),
                                DropdownMenuItem(
                                  value: 20,
                                  child: Text('20 ft'),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              onChanged: (int? newLaunchDistance) {
                                setState(() {
                                  dataCollectionPageData.launchDistance =
                                      newLaunchDistance!;
                                });
                                ref
                                    .read(
                                      dataCollectionDataSavingsProvider
                                          .notifier,
                                    )
                                    .calculateLaunchPoints(newLaunchDistance!);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataRowContainer(
                      height: 45,
                      borderWidth: 2,
                      padding: 0,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Label(
                              label: 'Launch Points:',
                              verticalSpace: 0,
                              horizontalSpace: 10,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Label(
                              label: '${dataCollectionPageData.launchPoints}',
                              verticalSpace: 0,
                              horizontalSpace: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataPanel extends ConsumerStatefulWidget {
  int pointTypeInput;

  DataPanel({super.key, required this.pointTypeInput});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return DataPanelState(pointType: pointTypeInput);
  }
}

class DataPanelState extends ConsumerState<DataPanel> {
  int pointType;

  DataPanelState({required this.pointType});

  @override
  Widget build(BuildContext context) {
    late int linkedVariable;
    final _data = ref.watch(dataCollectionDataSavingsProvider);
    switch (pointType) {
      case 1:
        linkedVariable = _data.deliveryTrayPizzas;
        break;
      case 2:
        linkedVariable = _data.ovenColumnPizzas;
        break;
      case 3:
        linkedVariable = _data.deliveryHatchPizzas;
        break;
    }
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(0, 100),
                shape: RoundedRectangleBorder(),
                backgroundColor: Color(0xfff6ff00),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              onPressed: () {
                ref
                    .read(dataCollectionDataSavingsProvider.notifier)
                    .subtractPizza(pointType);
              },
              child: Icon(color: Colors.black, Icons.remove),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfff6ff00),
                border: Border.all(color: Colors.black, width: 2),
              ),
              height: 100,
              child: Align(
                alignment: Alignment.center,
                child: Label(
                  label: '$linkedVariable',
                  verticalSpace: 0,
                  horizontalSpace: 0,
                ),
              ),
            ),
          ),
          Expanded(
            child: FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(0, 100),
                shape: RoundedRectangleBorder(),
                backgroundColor: Color(0xfff6ff00),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              onPressed: () {
                ref
                    .read(dataCollectionDataSavingsProvider.notifier)
                    .addPizza(pointType);
              },
              child: Icon(color: Colors.black, Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class TemporaryDataPanel extends ConsumerStatefulWidget {
  int pointTypeInput;

  TemporaryDataPanel({super.key, required this.pointTypeInput});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return TemporaryDataPanelState(pointType: pointTypeInput);
  }
}

class TemporaryDataPanelState extends ConsumerState<TemporaryDataPanel> {
  int pointType;

  TemporaryDataPanelState({required this.pointType});

  @override
  Widget build(BuildContext context) {
    late int linkedVariable;
    final _data = ref.watch(dataCollectionDataSavingsProvider);
    switch (pointType) {
      case 1:
        linkedVariable = _data.comboBonuses;
        break;
      case 2:
        linkedVariable = _data.ovenOverrides;
        break;
    }
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(0, 100),
                shape: RoundedRectangleBorder(),
                backgroundColor: Color(0xfff6ff00),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              onPressed: () {
                ref
                    .read(dataCollectionDataSavingsProvider.notifier)
                    .removeScoreBonus(pointType);
              },
              child: Icon(color: Colors.black, Icons.remove),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfff6ff00),
                border: Border.all(color: Colors.black, width: 2),
              ),
              height: 100,
              child: Align(
                alignment: Alignment.center,
                child: Label(
                  label: '$linkedVariable',
                  verticalSpace: 0,
                  horizontalSpace: 0,
                ),
              ),
            ),
          ),
          Expanded(
            child: FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(0, 100),
                shape: RoundedRectangleBorder(),
                backgroundColor: Color(0xfff6ff00),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              onPressed: () {
                ref
                    .read(dataCollectionDataSavingsProvider.notifier)
                    .addScoreBonus(pointType);
              },
              child: Icon(color: Colors.black, Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
