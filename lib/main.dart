import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prototyping_challenge_pizza_panic/match_information.dart';
import 'package:prototyping_challenge_pizza_panic/data_collection.dart';
import 'package:prototyping_challenge_pizza_panic/match_end.dart';
import 'package:prototyping_challenge_pizza_panic/results_provider.dart';

void main() {
  runApp(ProviderScope(child: PizzaPanicScoutingApp()));
}

class PizzaPanicScoutingApp extends StatelessWidget {
  const PizzaPanicScoutingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        scaffoldBackgroundColor: Colors.white10
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends ConsumerState<MainPage> {
  final List<Widget> pages = [
    MatchInformationPage(),
    DataCollectionPage(),
    MatchEndPage(),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          ref.read(dataSavingsNotifierProvider.notifier).saveData();
          setState(() {currentPage = value;});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Match Information'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Data Collection'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment),
              label: 'Match End'
          )
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Color(0xffdb3535),
        unselectedItemColor: Color(0xfff6ff00)
      ),
    );
  }
}

class DataRowContainer extends StatelessWidget {
  final double height;
  final double borderWidth;
  final double padding;
  final Widget child;

  const DataRowContainer({
    super.key,
    required this.height,
    required this.borderWidth,
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffffc547),
                border: Border.all(color: Colors.black, width: borderWidth),
              ),
              height: height,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}

class Label extends StatelessWidget {
  String label;
  double verticalSpace;
  double horizontalSpace;

  Label({
    super.key,
    required this.label,
    required this.verticalSpace,
    required this.horizontalSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalSpace,
        horizontal: horizontalSpace,
      ),
      child: Text(
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        label,
      ),
    );
  }
}