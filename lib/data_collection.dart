import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    this.deliveryTrayPoints, this.ovenColumnPoints, this.deliveryHatchPoints,
    this.deliveryTrayPizzas, this.ovenColumnPizzas, this.deliveryHatchPizzas,
    this.comboBonuses, this.ovenOverrides,
    this.comboBonusPoints, this.ovenOverridePoints,
    this.launchDistance, this.launchPoints
  );
}

class DataCollectionDataSavings extends Notifier<DataCollectionData> {

  @override
  DataCollectionData build() => DataCollectionData(
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  );
}

final dataCollectionDataSavingsProvider = NotifierProvider<
    DataCollectionDataSavings, DataCollectionData> (
    DataCollectionDataSavings.new
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
    return Scaffold(

    );
  }
}