//to start any Application ,you should write the code
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String dayImg
  Map receivedDataFromLoading = {};
  @override
  Widget build(BuildContext context) {
    if (receivedDataFromLoading.isEmpty) {
      receivedDataFromLoading =
          ModalRoute.of(context)!.settings.arguments as Map;
    }
    return Scaffold(
      // appBar: AppBar(title: Text("Home"),),
      body: Container(
        // height: 1200,
        // width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(115, 67, 67, 67),
            image: DecorationImage(
              image: (receivedDataFromLoading["isMorning"])
                  ? AssetImage("assets/img/day.png")
                  : AssetImage("assets/img/night.png"),
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    (result == null)
                        ? receivedDataFromLoading = {
                            "time": "",
                            "timezone": "",
                            "isMorning": false,
                            "countryName": "pleas chiose country"
                          }
                        : receivedDataFromLoading = {
                            "time": result["time"],
                            "timezone": result["timezone"],
                            "isMorning": result["isMorning"],
                            "countryName": result["countryName"]
                          };
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(116, 217, 0, 255))),
                icon: Icon(Icons.edit_location),
                label: Text(
                  "  Edit Location  ",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                height: 111,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Color.fromARGB(107, 105, 105, 105)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      receivedDataFromLoading['time'],
                      // "10 : 30 am",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      receivedDataFromLoading["countryName"],
                      // "Egypt / Cairo",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
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
