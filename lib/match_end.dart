import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prototyping_challenge_pizza_panic/results_provider.dart';

class MatchEndData {
  bool humanBoundaryCross;
  bool robotBoundaryCross;

  String notes;

  MatchEndData(
    this.humanBoundaryCross, this.robotBoundaryCross, this.notes
  );
}

class MatchEndDataSavings extends Notifier<MatchEndData> {

  @override
  MatchEndData build() => MatchEndData(
      false, false, ''
  );
}

final matchEndDataSavingsProvider = NotifierProvider<
    MatchEndDataSavings, MatchEndData> (
    MatchEndDataSavings.new
);

class MatchEndPage extends ConsumerStatefulWidget {
  const MatchEndPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return MatchEndPageState();
  }
}

class MatchEndPageState extends ConsumerState<MatchEndPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}