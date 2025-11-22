import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prototyping_challenge_pizza_panic/main.dart';
import 'package:prototyping_challenge_pizza_panic/results_provider.dart';

class MatchEndData {
  bool humanBoundaryCross;
  bool robotBoundaryCross;

  String notes;

  MatchEndData(this.humanBoundaryCross, this.robotBoundaryCross, this.notes);

  MatchEndData copyWith({
    bool? humanBoundaryCross,
    bool? robotBoundaryCross,
    String? notes,
  }) {
    return MatchEndData(
      humanBoundaryCross ?? this.humanBoundaryCross,
      robotBoundaryCross ?? this.robotBoundaryCross,
      notes ?? this.notes,
    );
  }

  @override
  String toString() {
    return 'Match End:\n'
        'Human Interference: $humanBoundaryCross\n'
        'Robot Boundary Cross: $robotBoundaryCross\n'
        'Notes: $notes';
  }
}

class MatchEndDataSavings extends Notifier<MatchEndData> {
  @override
  MatchEndData build() => MatchEndData(false, false, '');

  void updateHumanBoundaryCross(bool? value) =>
      state = state.copyWith(humanBoundaryCross: value!);

  void updateRobotBoundaryCross(bool? value) =>
      state = state.copyWith(robotBoundaryCross: value!);

  void updateNotes(String notes) {
    String newNotes = notes;
    state = state.copyWith(notes: newNotes);
  }
}

final matchEndDataSavingsProvider =
    NotifierProvider<MatchEndDataSavings, MatchEndData>(
      MatchEndDataSavings.new,
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
    final matchEndPageData = ref.watch(matchEndDataSavingsProvider);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                              label: 'Human Interference?',
                              verticalSpace: 0,
                              horizontalSpace: 10,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Checkbox(
                              value: matchEndPageData.humanBoundaryCross,
                              onChanged: (bool? value) {
                                ref
                                    .read(matchEndDataSavingsProvider.notifier)
                                    .updateHumanBoundaryCross(value);
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
                              label: 'Robot Crossed Perimeter?',
                              verticalSpace: 0,
                              horizontalSpace: 10,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Checkbox(
                              value: matchEndPageData.robotBoundaryCross,
                              onChanged: (bool? value) {
                                ref
                                    .read(matchEndDataSavingsProvider.notifier)
                                    .updateRobotBoundaryCross(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              DataRowContainer(
                height: 500,
                borderWidth: 4,
                padding: 20,
                child: TextFormField(
                  initialValue: ref.read(matchEndDataSavingsProvider).notes,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: null,
                  onChanged: (value) {
                    ref.read(matchEndDataSavingsProvider.notifier).updateNotes(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfff6ff00),
                  ),
                  onPressed: () {
                    ref.read(dataSavingsNotifierProvider.notifier).saveData();
                  },
                  child: Text(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    'Initialize Upload',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
