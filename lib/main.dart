
                                                                 // ignore_for_file: prefer_const_constructors
                                                                 
//to start any Application ,you should write the code
import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/pages/choiseLocation.dart';
import 'package:flutter_world_time_app/pages/home.dart';
import 'package:flutter_world_time_app/pages/loading.dart';

void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => Loading(),
        '/home' : (context) => Home(),
        '/location' : (context) => ChoiseLocation(),
      },
    );
  }
}

