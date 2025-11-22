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
    state.totalPizzasScored++;
    switch (inputLocation) {
      case 1:
        state.deliveryTrayPizzas++;
        state.deliveryTrayPoints = (state.deliveryTrayPizzas * 3);
        break;
      case 2:
        state.ovenColumnPizzas++;
        state.ovenColumnPoints = (state.ovenColumnPizzas * 5);
        break;
      case 3:
        state.deliveryHatchPizzas++;
        state.deliveryHatchPoints = (state.deliveryHatchPizzas * 8);
        break;
    }
    // Combo Bonus and Oven Override Calculations
    state = state;
  }

  void subtractPizza(int inputLocation) {
    state.totalPizzasScored--;
    int newDeliveryTrayPizzas = state.deliveryTrayPizzas;
    int newOvenColumnPizzas = state.ovenColumnPizzas;
    int newDeliveryHatchPizzas = state.deliveryHatchPizzas;
    int newDeliveryTrayPoints = state.deliveryTrayPoints;
    int newOvenColumnPoints = state.ovenColumnPoints;
    int newDeliveryHatchPoints = state.deliveryHatchPoints;

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
    // Combo Bonus and Oven Override Calculations
    state = state.copyWith(
      deliveryTrayPizzas: newDeliveryTrayPizzas,
      ovenColumnPizzas: newOvenColumnPizzas,
      deliveryHatchPizzas: newDeliveryHatchPizzas,
      deliveryTrayPoints: newDeliveryTrayPoints,
      ovenColumnPoints: newOvenColumnPoints,
      deliveryHatchPoints: newDeliveryHatchPoints,
      totalPizzasScored: state.totalPizzasScored - 1,
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
    final _provider = ref.read(dataCollectionDataSavingsProvider.notifier);
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