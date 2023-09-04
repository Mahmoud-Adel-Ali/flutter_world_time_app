//to start any Application ,you should write the code
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/widget/card.dart';

class Country {
  Country({required this.cTitle, required this.cAsset, required this.link});
  final String cTitle;
  final String cAsset;
  final String link;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChoiseLocation(),
    );
  }
}

class ChoiseLocation extends StatefulWidget {
  const ChoiseLocation({super.key});

  @override
  State<ChoiseLocation> createState() => _ChoiseLocationState();
}

class _ChoiseLocationState extends State<ChoiseLocation> {
  List allCountry = [
    Country(
        cTitle: "Egypt , Cairo",
        cAsset: "assets/img/egypt.png",
        link: "Africa/Cairo"),
    Country(
        cTitle: "Tunis , Tunis",
        cAsset: "assets/img/tunisia.png",
        link: "Africa/Tunis"),
    Country(
        cTitle: "Algeria , Algiers",
        cAsset: "assets/img/algeria.png",
        link: "Africa/Algiers"),
    Country(
        cTitle: "Australia , Sydney",
        cAsset: "assets/img/australia.png",
        link: "Australia/Sydney"),
    Country(
        cTitle: "Canada , Toronto",
        cAsset: "assets/img/canada.png",
        link: "America/Toronto"),
    Country(
        cTitle: "Saudi Arabian , Riyad",
        cAsset: "assets/img/sa.png",
        link: "Asia/Riyadh"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text("Choise Country", style: TextStyle(fontSize: 30)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...allCountry.map((e) => ShowCard(
                title: e.cTitle,
                asset: e.cAsset,
                link: e.link,
              ))
        ],
      ),
    );
  }
}
