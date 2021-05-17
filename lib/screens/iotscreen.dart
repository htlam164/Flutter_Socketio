import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class IotScreen extends StatefulWidget {
  @override
  _IotScreenState createState() => _IotScreenState();
}

int realtime1 = 0;
int realtime2 = 0;
int realtime3 = 0;
int realtime4 = 0;
int realtime5 = 0;
int realtime6 = 0;
// ignore: unused_element
Timer _timer;

class SecondPagez6 extends StatefulWidget {
  @override
  _SecondPagez6 createState() => _SecondPagez6();
}

class _SecondPagez6 extends State<SecondPagez6>
    with SingleTickerProviderStateMixin {
  final dbRef = FirebaseDatabase.instance.reference();
  bool value = true;
  Color color = Colors.white;

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 6",
              style: new TextStyle(
                  color: value ? Colors.white : Colors.yellow,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram6").onValue,
                    builder: (context, snapshot) {
                      while (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data.snapshot.value != null &&
                          snapshot.data.snapshot.value["RealTime"] !=
                              realtime3) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime3 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Temperature",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["nhietdo"]
                                                .toString() +
                                            "°C",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Humidity",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["doam"]
                                                .toString() +
                                            "%",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("cps",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["cps"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("uSv",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["uSv"]
                                                .toString() +
                                            "uSv/h",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Total Counts",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot
                                                .value["Totalcounts"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: FloatingActionButton.extended(
                              icon: value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              backgroundColor:
                                  value ? Colors.yellow : Colors.white,
                              label: value
                                  ? Text("Bật Cảnh Báo")
                                  : Text("Tắt Cảnh Báo"),
                              elevation: 20.00,
                              onPressed: () {
                                onUpdate();
                                writeData();
                              },
                            ),
                          ),
                          SizedBox(height: 50),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                    DateFormat.yMEd()
                                        .add_jms()
                                        .format(DateTime.now()),
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: value
                                            ? Colors.white
                                            : Colors.yellow)),
                              ),
                            ],
                          ),
                        ]);
                      }
                      return (Column(children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Tram6",
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("DISCONNECTED",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]));
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram6").set({"switch": !value});
  }
}

class SixthPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      title: 'REWES',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: SecondPagez6(),
    );
  }
}

class SecondPagez5 extends StatefulWidget {
  @override
  _SecondPagez5 createState() => _SecondPagez5();
}

class _SecondPagez5 extends State<SecondPagez5>
    with SingleTickerProviderStateMixin {
  final dbRef = FirebaseDatabase.instance.reference();
  bool value = true;
  Color color = Colors.white;

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 5",
              style: new TextStyle(
                  color: value ? Colors.white : Colors.yellow,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram5").onValue,
                    builder: (context, snapshot) {
                      while (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data.snapshot.value != null &&
                          snapshot.data.snapshot.value["RealTime"] !=
                              realtime3) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime3 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Temperature",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["nhietdo"]
                                                .toString() +
                                            "°C",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Humidity",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["doam"]
                                                .toString() +
                                            "%",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("cps",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["cps"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("uSv",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["uSv"]
                                                .toString() +
                                            "uSv/h",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Total Counts",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot
                                                .value["Totalcounts"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: FloatingActionButton.extended(
                              icon: value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              backgroundColor:
                                  value ? Colors.yellow : Colors.white,
                              label: value
                                  ? Text("Bật Cảnh Báo")
                                  : Text("Tắt Cảnh Báo"),
                              elevation: 20.00,
                              onPressed: () {
                                onUpdate();
                                writeData();
                              },
                            ),
                          ),
                          SizedBox(height: 50),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                    DateFormat.yMEd()
                                        .add_jms()
                                        .format(DateTime.now()),
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: value
                                            ? Colors.white
                                            : Colors.yellow)),
                              ),
                            ],
                          ),
                        ]);
                      }
                      return (Column(children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Tram5",
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("DISCONNECTED",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]));
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram5").set({"switch": !value});
  }
}

class ThursPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      title: 'REWES',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: SecondPagez5(),
    );
  }
}

class SecondPagez4 extends StatefulWidget {
  @override
  _SecondPagez4 createState() => _SecondPagez4();
}

class _SecondPagez4 extends State<SecondPagez4>
    with SingleTickerProviderStateMixin {
  final dbRef = FirebaseDatabase.instance.reference();
  bool value = true;
  Color color = Colors.white;

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 4",
              style: new TextStyle(
                  color: value ? Colors.white : Colors.yellow,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram4").onValue,
                    builder: (context, snapshot) {
                      while (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data.snapshot.value != null &&
                          snapshot.data.snapshot.value["RealTime"] !=
                              realtime3) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime3 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Temperature",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["nhietdo"]
                                                .toString() +
                                            "°C",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Humidity",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["doam"]
                                                .toString() +
                                            "%",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("cps",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["cps"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("uSv",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["uSv"]
                                                .toString() +
                                            "uSv/h",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Total Counts",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot
                                                .value["Totalcounts"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: FloatingActionButton.extended(
                              icon: value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              backgroundColor:
                                  value ? Colors.yellow : Colors.white,
                              label: value
                                  ? Text("Bật Cảnh Báo")
                                  : Text("Tắt Cảnh Báo"),
                              elevation: 20.00,
                              onPressed: () {
                                onUpdate();
                                writeData();
                              },
                            ),
                          ),
                          SizedBox(height: 50),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                    DateFormat.yMEd()
                                        .add_jms()
                                        .format(DateTime.now()),
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: value
                                            ? Colors.white
                                            : Colors.yellow)),
                              ),
                            ],
                          ),
                        ]);
                      }
                      return (Column(children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Tram4",
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("DISCONNECTED",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]));
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram4").set({"switch": !value});
  }
}

class FourPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      title: 'REWES',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: SecondPagez4(),
    );
  }
}

class SecondPagez3 extends StatefulWidget {
  @override
  _SecondPagez3 createState() => _SecondPagez3();
}

class _SecondPagez3 extends State<SecondPagez3>
    with SingleTickerProviderStateMixin {
  final dbRef = FirebaseDatabase.instance.reference();
  bool value = true;
  Color color = Colors.white;

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 3",
              style: new TextStyle(
                  color: value ? Colors.white : Colors.yellow,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram3").onValue,
                    builder: (context, snapshot) {
                      while (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data.snapshot.value != null &&
                          snapshot.data.snapshot.value["RealTime"] !=
                              realtime3) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime3 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Temperature",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["nhietdo"]
                                                .toString() +
                                            "°C",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Humidity",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["doam"]
                                                .toString() +
                                            "%",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("cps",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["cps"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("uSv",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["uSv"]
                                                .toString() +
                                            "uSv/h",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Total Counts",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot
                                                .value["Totalcounts"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: FloatingActionButton.extended(
                              icon: value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              backgroundColor:
                                  value ? Colors.yellow : Colors.white,
                              label: value
                                  ? Text("Bật Cảnh Báo")
                                  : Text("Tắt Cảnh Báo"),
                              elevation: 20.00,
                              onPressed: () {
                                onUpdate();
                                writeData();
                              },
                            ),
                          ),
                          SizedBox(height: 50),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                    DateFormat.yMEd()
                                        .add_jms()
                                        .format(DateTime.now()),
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: value
                                            ? Colors.white
                                            : Colors.yellow)),
                              ),
                            ],
                          ),
                        ]);
                      }
                      return (Column(children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Tram3",
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("DISCONNECTED",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]));
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram3").set({"switch": !value});
  }
}

class ThirdPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      title: 'REWES',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: SecondPagez3(),
    );
  }
}

class SecondPagez1 extends StatefulWidget {
  @override
  _SecondPagez1 createState() => _SecondPagez1();
}

class _SecondPagez1 extends State<SecondPagez1>
    with SingleTickerProviderStateMixin {
  final dbRef = FirebaseDatabase.instance.reference();
  bool value = true;
  Color color = Colors.white;

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 1",
              style: new TextStyle(
                  color: value ? Colors.white : Colors.yellow,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram1").onValue,
                    builder: (context, snapshot) {
                      while (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data.snapshot.value != null &&
                          snapshot.data.snapshot.value["RealTime"] !=
                              realtime3) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime3 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Temperature",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["nhietdo"]
                                                .toString() +
                                            "°C",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Humidity",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["doam"]
                                                .toString() +
                                            "%",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("cps",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["cps"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("uSv",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["uSv"]
                                                .toString() +
                                            "uSv/h",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Total Counts",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot
                                                .value["Totalcounts"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: FloatingActionButton.extended(
                              icon: value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              backgroundColor:
                                  value ? Colors.yellow : Colors.white,
                              label: value
                                  ? Text("Bật Cảnh Báo")
                                  : Text("Tắt Cảnh Báo"),
                              elevation: 20.00,
                              onPressed: () {
                                onUpdate();
                                writeData();
                              },
                            ),
                          ),
                          SizedBox(height: 50),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                    DateFormat.yMEd()
                                        .add_jms()
                                        .format(DateTime.now()),
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: value
                                            ? Colors.white
                                            : Colors.yellow)),
                              ),
                            ],
                          ),
                        ]);
                      }
                      return (Column(children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Tram1",
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("DISCONNECTED",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]));
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram1").set({"switch": !value});
  }
}

class FirstPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      title: 'REWES',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: SecondPagez1(),
    );
  }
}

class SecondPagez2 extends StatefulWidget {
  @override
  _SecondPagez2 createState() => _SecondPagez2();
}

class _SecondPagez2 extends State<SecondPagez2>
    with SingleTickerProviderStateMixin {
  final dbRef = FirebaseDatabase.instance.reference();
  bool value = true;
  Color color = Colors.white;

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 2",
              style: new TextStyle(
                  color: value ? Colors.white : Colors.yellow,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram2").onValue,
                    builder: (context, snapshot) {
                      while (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data.snapshot.value != null &&
                          snapshot.data.snapshot.value["RealTime"] !=
                              realtime3) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime3 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Temperature",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["nhietdo"]
                                                .toString() +
                                            "°C",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Humidity",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["doam"]
                                                .toString() +
                                            "%",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("cps",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["cps"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("uSv",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["uSv"]
                                                .toString() +
                                            "uSv/h",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Total Counts",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot
                                                .value["Totalcounts"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: FloatingActionButton.extended(
                              icon: value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              backgroundColor:
                                  value ? Colors.yellow : Colors.white,
                              label: value
                                  ? Text("Bật Cảnh Báo")
                                  : Text("Tắt Cảnh Báo"),
                              elevation: 20.00,
                              onPressed: () {
                                onUpdate();
                                writeData();
                              },
                            ),
                          ),
                          SizedBox(height: 50),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                    DateFormat.yMEd()
                                        .add_jms()
                                        .format(DateTime.now()),
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: value
                                            ? Colors.white
                                            : Colors.yellow)),
                              ),
                            ],
                          ),
                        ]);
                      }
                      return (Column(children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("Tram2",
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("DISCONNECTED",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]));
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram2").set({"switch": !value});
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REWES',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: SecondPagez2(),
    );
  }
}

class _IotScreenState extends State<IotScreen>
    with SingleTickerProviderStateMixin {
  final dbRef = FirebaseDatabase.instance.reference();
  bool value = true;
  Color color = Colors.white;

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: 'REWES',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
              child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                child: new Text("Station",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold)),
                decoration: new BoxDecoration(
                  color: Colors.orange,
                ),
              ),
              new ListTile(
                title: new Text("Station 1"),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (ctxt) => new FirstPage()));
                },
              ),
              new ListTile(
                title: new Text("Station 2"),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (ctxt) => new SecondPage()));
                },
              ),
              new ListTile(
                title: new Text("Station 3"),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (ctxt) => new ThirdPage()));
                },
              ),
              new ListTile(
                title: new Text("Station 4"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (ctxt) => new FourPage()));
                },
              ),
              new ListTile(
                title: new Text("Station 5"),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (ctxt) => new ThursPage()));
                },
              ),
              new ListTile(
                title: new Text("Station 6"),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (ctxt) => new SixthPage()));
                },
              ),
            ],
          )),
          body: SafeArea(
            child: StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState.openDrawer();
                          },

                          child: Icon(
                            Icons.clear_all,
                            size: 50,
                            color: Colors.yellow,
                          ),
                          // ),
                        ),
                        Text("REWES - V1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),

                        Icon(
                          Icons.settings,
                          size: 50,
                          color: Colors.yellow,
                        ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("Real Time Monitoring Stations",
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                            DateFormat.yMEd().add_jms().format(DateTime.now()),
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SpinKitRipple(color: Colors.yellow),
                      SizedBox(height: 30.0),
                      Image.asset(
                        'assets/radiation.png',
                        height: 150,
                      ),
                      
                      
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(18.0),
                  //   child: FloatingActionButton.extended(
                  //     icon: value
                  //         ? Icon(Icons.visibility)
                  //         : Icon(Icons.visibility_off),
                  //     backgroundColor: value ? Colors.yellow : Colors.white,
                  //     label:
                  //         value ? Text("Bật Cảnh Báo") : Text("Tắt Cảnh Báo"),
                  //     elevation: 20.00,
                  //     onPressed: () {
                  //       onUpdate();
                  //       writeData();
                  //     },
                  //   ),
                  // ),
                ]);
              },
            ),
          ),
        ));
  }

  Future<void> writeData() async {
    dbRef.child("LightState").set({"switch": !value});
  }
}
