import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

int realtime1 = 0;
int realtime2 = 0;
int realtime3 = 0;
int realtime4 = 0;
int realtime5 = 0;
int realtime6 = 0;
int realtime7 = 0;
int realtime8 = 0;
int realtime9 = 0;
int realtime10 = 0;

// ignore: unused_element
Timer _timer;

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
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram1").onValue,
                    builder: (context, snapshot) {
                      if (realtime1 == 0) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime1 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 1",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Check Status",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitFadingCircle(color: Colors.yellow),
                            ],
                          ),
                        ]);
                      } else {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime1) {
                          _timer =
                              new Timer(const Duration(milliseconds: 2000), () {
                            realtime1 =
                                snapshot.data.snapshot.value["RealTime"];
                          });
                          return Column(children: [
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
                                          snapshot.data.snapshot
                                                  .value["nhietdo"]
                                                  .toString() +
                                              "°C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: FloatingActionButton.extended(
                                icon: value
                                    ? Icon(Icons.add_alert_outlined)
                                    : Icon(Icons.add_alert),
                                backgroundColor:
                                    value ? Colors.yellow : Colors.white,
                                label: value
                                    ? Text("Enable Alert")
                                    : Text("Disable Alert"),
                                elevation: 20.00,
                                onPressed: () {
                                  onUpdate();
                                  writeData();
                                },
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
                            Center(
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'View data  ',
                                      style: new TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    new TextSpan(
                                        text: 'Click here',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () async {
                                            var url =
                                                "http://api-rewes.glitch.me/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw "Cannot load URL";
                                            }
                                          }),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }

                        return (Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 1",
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
                      }
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram1").set({"switch": !value});
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
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram2").onValue,
                    builder: (context, snapshot) {
                      if (realtime2 == 0) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime2 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 2",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Check Status",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitFadingCircle(color: Colors.yellow),
                            ],
                          ),
                        ]);
                      } else {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime2) {
                          _timer =
                              new Timer(const Duration(milliseconds: 2000), () {
                            realtime2 =
                                snapshot.data.snapshot.value["RealTime"];
                          });
                          return Column(children: [
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
                                          snapshot.data.snapshot
                                                  .value["nhietdo"]
                                                  .toString() +
                                              "°C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: FloatingActionButton.extended(
                                icon: value
                                    ? Icon(Icons.add_alert_outlined)
                                    : Icon(Icons.add_alert),
                                backgroundColor:
                                    value ? Colors.yellow : Colors.white,
                                label: value
                                    ? Text("Enable Alert")
                                    : Text("Disable Alert"),
                                elevation: 20.00,
                                onPressed: () {
                                  onUpdate();
                                  writeData();
                                },
                              ),
                            ),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
                            Center(
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'View data  ',
                                      style: new TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    new TextSpan(
                                        text: 'Click here',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () async {
                                            var url =
                                                "http://api-rewes.glitch.me/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw "Cannot load URL";
                                            }
                                          }),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }
                        return (Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 2",
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
                      }
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram2").set({"switch": !value});
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
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram3").onValue,
                    builder: (context, snapshot) {
                      if (realtime3 == 0) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime3 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 3",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Check Status",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitFadingCircle(color: Colors.yellow),
                            ],
                          ),
                        ]);
                      } else {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime3) {
                          _timer =
                              new Timer(const Duration(milliseconds: 2000), () {
                            realtime3 =
                                snapshot.data.snapshot.value["RealTime"];
                          });
                          return Column(children: [
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
                                          snapshot.data.snapshot
                                                  .value["nhietdo"]
                                                  .toString() +
                                              "°C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: FloatingActionButton.extended(
                                icon: value
                                    ? Icon(Icons.add_alert_outlined)
                                    : Icon(Icons.add_alert),
                                backgroundColor:
                                    value ? Colors.yellow : Colors.white,
                                label: value
                                    ? Text("Enable Alert")
                                    : Text("Disable Alert"),
                                elevation: 20.00,
                                onPressed: () {
                                  onUpdate();
                                  writeData();
                                },
                              ),
                            ),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
                            Center(
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'View data  ',
                                      style: new TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    new TextSpan(
                                        text: 'Click here',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () async {
                                            var url =
                                                "http://api-rewes.glitch.me/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw "Cannot load URL";
                                            }
                                          }),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }
                        return (Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 3",
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
                      }
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram3").set({"switch": !value});
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
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram4").onValue,
                    builder: (context, snapshot) {
                      if (realtime4 == 0) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime4 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 4",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Check Status",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitFadingCircle(color: Colors.yellow),
                            ],
                          ),
                        ]);
                      } else {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime4) {
                          _timer =
                              new Timer(const Duration(milliseconds: 2000), () {
                            realtime4 =
                                snapshot.data.snapshot.value["RealTime"];
                          });
                          return Column(children: [
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
                                          snapshot.data.snapshot
                                                  .value["nhietdo"]
                                                  .toString() +
                                              "°C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: FloatingActionButton.extended(
                                icon: value
                                    ? Icon(Icons.add_alert_outlined)
                                    : Icon(Icons.add_alert),
                                backgroundColor:
                                    value ? Colors.yellow : Colors.white,
                                label: value
                                    ? Text("Enable Alert")
                                    : Text("Disable Alert"),
                                elevation: 20.00,
                                onPressed: () {
                                  onUpdate();
                                  writeData();
                                },
                              ),
                            ),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
                            Center(
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'View data  ',
                                      style: new TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    new TextSpan(
                                        text: 'Click here',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () async {
                                            var url =
                                                "http://api-rewes.glitch.me/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw "Cannot load URL";
                                            }
                                          }),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }
                        return (Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 4",
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
                      }
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram4").set({"switch": !value});
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
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram5").onValue,
                    builder: (context, snapshot) {
                      if (realtime5 == 0) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime5 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 5",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Check Status",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitFadingCircle(color: Colors.yellow),
                            ],
                          ),
                        ]);
                      } else {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime5) {
                          _timer =
                              new Timer(const Duration(milliseconds: 2000), () {
                            realtime5 =
                                snapshot.data.snapshot.value["RealTime"];
                          });
                          return Column(children: [
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
                                          snapshot.data.snapshot
                                                  .value["nhietdo"]
                                                  .toString() +
                                              "°C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                    ? Icon(Icons.add_alert_outlined)
                                    : Icon(Icons.add_alert),
                                backgroundColor:
                                    value ? Colors.yellow : Colors.white,
                                label: value
                                    ? Text("Enable Alert")
                                    : Text("Disable Alert"),
                                elevation: 20.00,
                                onPressed: () {
                                  onUpdate();
                                  writeData();
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(color: Colors.yellow),
                              ],
                            ),
                            
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
                            
                            Center(
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'View data  ',
                                      style: new TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    new TextSpan(
                                        text: 'Click here',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () async {
                                            var url =
                                                "http://api-rewes.glitch.me/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw "Cannot load URL";
                                            }
                                          }),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }
                        return (Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 5",
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
                      }
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram5").set({"switch": !value});
  }
}

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
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram6").onValue,
                    builder: (context, snapshot) {
                      if (realtime6 == 0) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime6 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 6",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Check Status",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitFadingCircle(color: Colors.yellow),
                            ],
                          ),
                        ]);
                      } else {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime6) {
                          _timer =
                              new Timer(const Duration(milliseconds: 2000), () {
                            realtime6 =
                                snapshot.data.snapshot.value["RealTime"];
                          });
                          return Column(children: [
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
                                          snapshot.data.snapshot
                                                  .value["nhietdo"]
                                                  .toString() +
                                              "°C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: FloatingActionButton.extended(
                                icon: value
                                    ? Icon(Icons.add_alert_outlined)
                                    : Icon(Icons.add_alert),
                                backgroundColor:
                                    value ? Colors.yellow : Colors.white,
                                label: value
                                    ? Text("Enable Alert")
                                    : Text("Disable Alert"),
                                elevation: 20.00,
                                onPressed: () {
                                  onUpdate();
                                  writeData();
                                },
                              ),
                            ),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
                            Center(
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'View data  ',
                                      style: new TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    new TextSpan(
                                        text: 'Click here',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () async {
                                            var url =
                                                "http://api-rewes.glitch.me/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw "Cannot load URL";
                                            }
                                          }),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }
                        return (Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 6",
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
                      }
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram6").set({"switch": !value});
  }
}

class SecondPagez7 extends StatefulWidget {
  @override
  _SecondPagez7 createState() => _SecondPagez7();
}

class _SecondPagez7 extends State<SecondPagez7>
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
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram7").onValue,
                    builder: (context, snapshot) {
                      if (realtime7 == 0) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime7 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 7",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Check Status",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitFadingCircle(color: Colors.yellow),
                            ],
                          ),
                        ]);
                      } else {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime7) {
                          _timer =
                              new Timer(const Duration(milliseconds: 2000), () {
                            realtime7 =
                                snapshot.data.snapshot.value["RealTime"];
                          });
                          return Column(children: [
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
                                          snapshot.data.snapshot
                                                  .value["nhietdo"]
                                                  .toString() +
                                              "°C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: FloatingActionButton.extended(
                                icon: value
                                    ? Icon(Icons.add_alert_outlined)
                                    : Icon(Icons.add_alert),
                                backgroundColor:
                                    value ? Colors.yellow : Colors.white,
                                label: value
                                    ? Text("Enable Alert")
                                    : Text("Disable Alert"),
                                elevation: 20.00,
                                onPressed: () {
                                  onUpdate();
                                  writeData();
                                },
                              ),
                            ),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
                            Center(
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'View data  ',
                                      style: new TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    new TextSpan(
                                        text: 'Click here',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () async {
                                            var url =
                                                "http://api-rewes.glitch.me/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw "Cannot load URL";
                                            }
                                          }),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }
                        return (Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 7",
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
                      }
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram7").set({"switch": !value});
  }
}

class SecondPagez8 extends StatefulWidget {
  @override
  _SecondPagez8 createState() => _SecondPagez8();
}

class _SecondPagez8 extends State<SecondPagez8>
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
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram8").onValue,
                    builder: (context, snapshot) {
                      if (realtime8 == 0) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime8 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 8",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Check Status",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitFadingCircle(color: Colors.yellow),
                            ],
                          ),
                        ]);
                      } else {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime8) {
                          _timer =
                              new Timer(const Duration(milliseconds: 2000), () {
                            realtime8 =
                                snapshot.data.snapshot.value["RealTime"];
                          });
                          return Column(children: [
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
                                          snapshot.data.snapshot
                                                  .value["nhietdo"]
                                                  .toString() +
                                              "°C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: FloatingActionButton.extended(
                                icon: value
                                    ? Icon(Icons.add_alert_outlined)
                                    : Icon(Icons.add_alert),
                                backgroundColor:
                                    value ? Colors.yellow : Colors.white,
                                label: value
                                    ? Text("Enable Alert")
                                    : Text("Disable Alert"),
                                elevation: 20.00,
                                onPressed: () {
                                  onUpdate();
                                  writeData();
                                },
                              ),
                            ),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
                            Center(
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'View data  ',
                                      style: new TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    new TextSpan(
                                        text: 'Click here',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () async {
                                            var url =
                                                "http://api-rewes.glitch.me/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw "Cannot load URL";
                                            }
                                          }),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }
                        return (Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 8",
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
                      }
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram8").set({"switch": !value});
  }
}

class SecondPagez9 extends StatefulWidget {
  @override
  _SecondPagez9 createState() => _SecondPagez9();
}

class _SecondPagez9 extends State<SecondPagez9>
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
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram9").onValue,
                    builder: (context, snapshot) {
                      if (realtime9 == 0) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime9 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 9",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Check Status",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitFadingCircle(color: Colors.yellow),
                            ],
                          ),
                        ]);
                      } else {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime9) {
                          _timer =
                              new Timer(const Duration(milliseconds: 2000), () {
                            realtime9 =
                                snapshot.data.snapshot.value["RealTime"];
                          });
                          return Column(children: [
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
                                          snapshot.data.snapshot
                                                  .value["nhietdo"]
                                                  .toString() +
                                              "°C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: FloatingActionButton.extended(
                                icon: value
                                    ? Icon(Icons.add_alert_outlined)
                                    : Icon(Icons.add_alert),
                                backgroundColor:
                                    value ? Colors.yellow : Colors.white,
                                label: value
                                    ? Text("Enable Alert")
                                    : Text("Disable Alert"),
                                elevation: 20.00,
                                onPressed: () {
                                  onUpdate();
                                  writeData();
                                },
                              ),
                            ),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
                            Center(
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'View data  ',
                                      style: new TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    new TextSpan(
                                        text: 'Click here',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () async {
                                            var url =
                                                "http://api-rewes.glitch.me/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw "Cannot load URL";
                                            }
                                          }),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }
                        return (Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 9",
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
                      }
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram9").set({"switch": !value});
  }
}

class SecondPagez10 extends StatefulWidget {
  @override
  _SecondPagez10 createState() => _SecondPagez10();
}

class _SecondPagez10 extends State<SecondPagez10>
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
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                    stream: dbRef.child("Tram10").onValue,
                    builder: (context, snapshot) {
                      if (realtime10 == 0) {
                        _timer =
                            new Timer(const Duration(milliseconds: 2000), () {
                          realtime10 = snapshot.data.snapshot.value["RealTime"];
                        });
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 10",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Check Status",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitFadingCircle(color: Colors.yellow),
                            ],
                          ),
                        ]);
                      } else {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime10) {
                          _timer =
                              new Timer(const Duration(milliseconds: 2000), () {
                            realtime10 =
                                snapshot.data.snapshot.value["RealTime"];
                          });
                          return Column(children: [
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
                                          snapshot.data.snapshot
                                                  .value["nhietdo"]
                                                  .toString() +
                                              "°C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: FloatingActionButton.extended(
                                icon: value
                                    ? Icon(Icons.add_alert_outlined)
                                    : Icon(Icons.add_alert),
                                backgroundColor:
                                    value ? Colors.yellow : Colors.white,
                                label: value
                                    ? Text("Enable Alert")
                                    : Text("Disable Alert"),
                                elevation: 20.00,
                                onPressed: () {
                                  onUpdate();
                                  writeData();
                                },
                              ),
                            ),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
                            Center(
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'View data  ',
                                      style: new TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    new TextSpan(
                                        text: 'Click here',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () async {
                                            var url =
                                                "http://api-rewes.glitch.me/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw "Cannot load URL";
                                            }
                                          }),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }
                        return (Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Station 10",
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
                      }
                    },
                  );
                })));
  }

  Future<void> writeData() async {
    dbRef.child("LightState_Tram10").set({"switch": !value});
  }
}
