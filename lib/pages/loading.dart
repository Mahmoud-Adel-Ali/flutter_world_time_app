//to start any Application ,you should write the code
// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, unused_local_variable, use_build_context_synchronously, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:flutter_world_time_app/widget/getDataClass.dart';
import 'package:intl/intl.dart';
import 'package:flutter_world_time_app/pages/home.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Loading(),
    );
  }
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataFromApiEndPoint() async {
    AllCountries oneCuntry = AllCountries(activLink: "Africa/Cairo");
    await oneCuntry.getData();
    // Navigator.pushNamed(context, '/home');
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": oneCuntry.finalTime,
      "isMorning": oneCuntry.isMorning, //true or false
      "timezone": oneCuntry.timezone,
      "countryName": "Egypt , Cairo"
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromApiEndPoint();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Loading...."),
      //   backgroundColor: Color.fromARGB(255, 85, 79, 60),
      // ),

      backgroundColor: Color.fromARGB(255, 122, 69, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitSpinningLines(
              color: Color.fromARGB(255, 255, 158, 2),
              size: 150.0,
            ),
            Text("Loading....",style: TextStyle(
                color: Color.fromARGB(255, 255, 158, 2),
            ),)
          ],
        ),
      ),
    );
  }
}
