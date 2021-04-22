import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class IotScreen extends StatefulWidget {
  @override
  _IotScreenState createState() => _IotScreenState();
}

String realtime1 = "";
String realtime2 = "";
String realtime3 = "";
// ignore: unused_element
Timer _timer;

class ThirdPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 3"),
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 3)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                      stream: dbRef.child("Tram3").onValue,
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime1) {
                          _timer =
                              new Timer(const Duration(milliseconds: 3000), () {
                            realtime1 =
                                snapshot.data.snapshot.value["RealTime"];
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Time Station",
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                          snapshot.data.snapshot
                                                  .value["RealTime"]
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
                          ]);
                        } else {
                          return Column(children: [
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ]);
                        }
                      });
                })));
  }
}

class FirstPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 1"),
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 3)),
                builder: (context, snapshot) {
                  return StreamBuilder(
                      stream: dbRef.child("Tram1").onValue,
                      builder: (context, snapshot) {
                        while (snapshot.hasData &&
                            !snapshot.hasError &&
                            snapshot.data.snapshot.value != null &&
                            snapshot.data.snapshot.value["RealTime"] !=
                                realtime2) {
                          _timer =
                              new Timer(const Duration(milliseconds: 3000), () {
                            realtime2 =
                                snapshot.data.snapshot.value["RealTime"];
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Time Station",
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                          snapshot.data.snapshot
                                                  .value["RealTime"]
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
                      });
                })));
  }
}

class SecondPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 2"),
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 3)),
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
                            new Timer(const Duration(milliseconds: 3000), () {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Time Station",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        snapshot.data.snapshot.value["RealTime"]
                                                .toString() +
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
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
}

class _IotScreenState extends State<IotScreen>
    with SingleTickerProviderStateMixin {
  @override
  final dbRef = FirebaseDatabase.instance.reference();
  bool value = false;
  Color color = Colors.grey;

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //DateTime now = DateTime.now();
    //String formattedDate = DateFormat.yMEd().add_jms().format(DateTime.now());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
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
            ],
          )),
          body: SafeArea(
            child: StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Column(
                  children: [
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
                              color: value ? Colors.white : Colors.yellow,
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
                            color: value ? Colors.white : Colors.yellow,
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
                          child: Text("Date - Time",
                              style: TextStyle(
                                  color: value ? Colors.white : Colors.yellow,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: Text(
                              DateFormat.yMEd()
                                  .add_jms()
                                  .format(DateTime.now()),
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: FloatingActionButton.extended(
                        icon: value
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        backgroundColor: value ? Colors.yellow : Colors.white,
                        label: value ? Text("ON") : Text("OFF"),
                        elevation: 20.00,
                        onPressed: () {
                          onUpdate();
                          writeData();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }

  Future<void> writeData() async {
    dbRef.child("LightState").set({"switch": !value});
  }

  Future<void> readData() async {
    dbRef.child("Tram1").once().then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
  }
}
