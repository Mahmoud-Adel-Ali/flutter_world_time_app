// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/widget/getDataClass.dart';

class ShowCard extends StatelessWidget {
  // const ShowCard({super.key});
  ShowCard({required this.title, required this.asset, required this.link});
  final String title;
  final String asset;
  final String link;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // shape: ,
      child: ListTile(
          onTap: () async {
            AllCountries thisCountry = AllCountries(activLink: link);
            await thisCountry.getData();
            Navigator.pop(context, {
              "time": thisCountry.finalTime,
              "timezone": thisCountry.timezone,
              "isMorning": thisCountry.isMorning,
              "countryName": title
            });
          },
          leading: CircleAvatar(backgroundImage: AssetImage(asset)),
          title: Text(
            title,
            style: TextStyle(fontSize: 22),
          )),
    );
  }
}
