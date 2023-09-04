import 'dart:convert';

// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AllCountries {
  AllCountries({required this.activLink});
  String finalTime = "";
  String activLink;
  String timezone = "";
  late bool isMorning;
  getData() async {
    Response response =
        await get(Uri.parse("http://worldtimeapi.org/api/timezone/$activLink"));
    Map receivedDataFromApi = jsonDecode(response.body); // as Map
    int offset = int.parse(receivedDataFromApi["utc_offset"].substring(0, 3));
    // print("Offset $offset");
    DateTime realTimeNow = DateTime.parse(receivedDataFromApi["utc_datetime"])
        .add(Duration(hours: offset));
    // print("$widget");
    timezone = receivedDataFromApi["timezone"].toString();
    finalTime = DateFormat("hh:mm a").format(realTimeNow).toString();
    (realTimeNow.hour > 5 && realTimeNow.hour < 18)
        ? isMorning = true
        : isMorning = false;
    // Navigator.pushNamed(context, '/home');
  }
}
