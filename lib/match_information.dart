import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prototyping_challenge_pizza_panic/main.dart';
import 'package:prototyping_challenge_pizza_panic/data_collection.dart';
import 'package:prototyping_challenge_pizza_panic/results_provider.dart';

class MatchInformationData {
  String teamName;
  int matchNumber;

  int totalScore;
  int summativePoints;
  int summativePenalties;

  bool burnedMotor;
  bool detachedMechanism;
  int malfunctionNumber;
  int malfunctionPenalty;

  MatchInformationData(
    this.teamName,
    this.matchNumber,
    this.totalScore,
    this.summativePoints,
    this.summativePenalties,
    this.burnedMotor,
    this.detachedMechanism,
    this.malfunctionNumber,
    this.malfunctionPenalty,
  );

  MatchInformationData copyWith({
    String? teamName,
    int? matchNumber,
    int? totalScore,
    int? summativePoints,
    int? summativePenalties,
    bool? burnedMotor,
    bool? detachedMechanism,
    int? malfunctionNumber,
    int? malfunctionPenalty
  }) {
    return MatchInformationData(
      teamName ?? this.teamName,
      matchNumber ?? this.matchNumber,
      totalScore ?? this.totalScore,
      summativePoints ?? this.summativePoints,
      summativePenalties ?? this.summativePenalties,
      burnedMotor ?? this.burnedMotor,
      detachedMechanism ?? this.detachedMechanism,
      malfunctionNumber ?? this.malfunctionNumber,
      malfunctionPenalty ?? this.malfunctionPenalty,
    );
  }
}

class MatchInformationDataSavings extends Notifier<MatchInformationData> {
  @override
  MatchInformationData build() =>
      MatchInformationData('Papa John\'s', 1, 0, 0, 0, false, false, 0, 0);
}

final matchInformationDataSavingsProvider =
    NotifierProvider<MatchInformationDataSavings, MatchInformationData>(
      MatchInformationDataSavings.new,
    );

class MatchInformationPage extends ConsumerStatefulWidget {
  const MatchInformationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return MatchInformationPageState();
  }
}

class MatchInformationPageState extends ConsumerState<MatchInformationPage> {
  String teamNameDropdownValue = 'Papa John\'s';
  int _totalScore = 0;
  int _summativePoints = 0;
  int _summativePenalties = 0;
  bool _burnedMotor = false;
  bool _detachedMechanism = false;
  int _malfuctionNumber = 0;
  TextEditingController _matchNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final matchInformationPageData = ref.watch(matchInformationDataSavingsProvider);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DataRowContainer(
                height: 154,
                borderWidth: 2,
                padding: 20,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        DataRowContainer(
                          height: 75,
                          borderWidth: 2,
                          padding: 0,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: 50,
                                  child: Label(
                                    label: 'Match Number:',
                                    verticalSpace: 0,
                                    horizontalSpace: 10,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 220,
                                  height: 50,
                                  child: Stack(
                                    children: [
                                      TextFormField(
                                        controller: _matchNumber,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xfff6ff00),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          labelText: 'Enter the match number',
                                        ),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataRowContainer(
                          height: 75,
                          borderWidth: 2,
                          padding: 0,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: 50,
                                  child: Label(
                                    label: 'Team:',
                                    verticalSpace: 0,
                                    horizontalSpace: 10,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  child: DropdownButton<String>(
                                    value: teamNameDropdownValue,
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'Papa John\'s',
                                        child: Text('Papa John\'s'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Little Caesars',
                                        child: Text('Little Caesars'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Pizza Hut',
                                        child: Text('Pizza Hut'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Farrelli\'s',
                                        child: Text('Farrelli\'s'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'MOD Pizza',
                                        child: Text('MOD Pizza'),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    onChanged: (String? newTeamScouting) {
                                      setState(() {
                                        teamNameDropdownValue =
                                            newTeamScouting!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              DataRowContainer(
                height: 139,
                borderWidth: 2,
                padding: 20,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        DataRowContainer(
                          height: 45,
                          borderWidth: 2,
                          padding: 0,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 45,
                                child: Label(
                                  label: 'Total Score:',
                                  horizontalSpace: 10,
                                  verticalSpace: 0,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: 45,
                                  child: Label(
                                    label: '$_totalScore',
                                    horizontalSpace: 10,
                                    verticalSpace: 0,
                                  ),
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
                                child: SizedBox(
                                  height: 45,
                                  child: Label(
                                    label: 'Summative Points:',
                                    horizontalSpace: 10,
                                    verticalSpace: 0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: 45,
                                  child: Label(
                                    label: '$_summativePoints',
                                    horizontalSpace: 10,
                                    verticalSpace: 0,
                                  ),
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
                                child: SizedBox(
                                  height: 45,
                                  child: Label(
                                    label: 'Summative Penalties:',
                                    horizontalSpace: 10,
                                    verticalSpace: 0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: 45,
                                  child: Label(
                                    label: '$_summativePenalties',
                                    horizontalSpace: 10,
                                    verticalSpace: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              DataRowContainer(
                height: 139,
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
                              label: 'Motor Burned?',
                              verticalSpace: 0,
                              horizontalSpace: 10,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Checkbox(
                              value: _burnedMotor,
                              onChanged: (bool? value) {
                                setState(() {
                                  _burnedMotor = value!;
                                });
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
                              label: 'Detached Mechanism?',
                              verticalSpace: 0,
                              horizontalSpace: 10,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Checkbox(
                              value: _detachedMechanism,
                              onChanged: (bool? value) {
                                setState(() {
                                  _detachedMechanism = value!;
                                });
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
                              label: 'Malfunctions:',
                              verticalSpace: 0,
                              horizontalSpace: 10,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: MatchInformationDataPanel(
                              linkedVariableInput: _malfuctionNumber,
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

class MatchInformationDataPanel extends StatefulWidget {
  int linkedVariableInput;

  MatchInformationDataPanel({super.key, required this.linkedVariableInput});

  @override
  State<StatefulWidget> createState() {
    return MatchInformationDataPanelState(linkedVariable: linkedVariableInput);
  }
}

class MatchInformationDataPanelState extends State<MatchInformationDataPanel> {
  int linkedVariable;

  MatchInformationDataPanelState({required this.linkedVariable});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Color(0xfff6ff00),
              side: BorderSide(color: Colors.black, width: 2)
            ),
            onPressed: () {
              setState(() {
                (linkedVariable--);
              });
            },
            child: Icon(
              color: Colors.black,
              Icons.remove
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Color(0xfff6ff00),
              side: BorderSide(color: Colors.black,width: 2)
            ),
            onPressed: () {
              setState(() {
                (linkedVariable++);
              });
            },
            child: Icon(
              color: Colors.black,
              Icons.add
            ),
          ),
        ],
      ),
    );
  }
}