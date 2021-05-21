import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/screens/stations.dart';


class IotScreen extends StatefulWidget {
  @override
  _IotScreenState createState() => _IotScreenState();
}

class SixthPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 6",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xFF212121),
        ),
        body: MaterialApp(
          title: 'REWES',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: SecondPagez6(),
        ));
  }
}

class ThursPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 5",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xFF212121),
        ),
        body: MaterialApp(
          title: 'REWES',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: SecondPagez5(),
        ));
  }
}

class FourPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 4",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xFF212121),
        ),
        body: MaterialApp(
          title: 'REWES',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: SecondPagez4(),
        ));
  }
}

class ThirdPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 3",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xFF212121),
        ),
        body: MaterialApp(
          title: 'REWES',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: SecondPagez3(),
        ));
  }
}

class FirstPage extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 1",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xFF212121),
        ),
        body: MaterialApp(
          title: 'REWES',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: SecondPagez1(),
        ));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 2",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xFF212121),
        ),
        body: MaterialApp(
          title: 'REWES',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: SecondPagez2(),
        ));
  }
}
class SeventhPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 7",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xFF212121),
        ),
        body: MaterialApp(
          title: 'REWES',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: SecondPagez7(),
        ));
  }
}
class EighthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 8",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xFF212121),
        ),
        body: MaterialApp(
          title: 'REWES',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: SecondPagez8(),
        ));
  }
}

class NinthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 9",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xFF212121),
        ),
        body: MaterialApp(
          title: 'REWES',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: SecondPagez9(),
        ));
  }
}

class TenthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Information - Station 10",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xFF212121),
        ),
        body: MaterialApp(
          title: 'REWES',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: SecondPagez10(),
        ));
  }
}

class _IotScreenState extends State<IotScreen>
    with SingleTickerProviderStateMixin {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?',
                style: TextStyle(color: Colors.yellowAccent, fontSize: 30)),
            content: new Text('Do you want to exit an App',
                style: TextStyle(color: Colors.yellowAccent, fontSize: 15)),
            backgroundColor: Color(0xFF424242),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No',
                    style: TextStyle(color: Colors.yellowAccent, fontSize: 30)),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: new Text('Yes',
                    style: TextStyle(color: Colors.yellowAccent, fontSize: 30)),
              ),
            ],
          ),
        )) ??
        false;
  }

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
    return WillPopScope(
        onWillPop: _onWillPop,
        child: MaterialApp(
            routes: <String, WidgetBuilder>{},
            title: 'REWES',
            theme: ThemeData(brightness: Brightness.dark),
            debugShowCheckedModeBanner: false,
            home: new Scaffold(
              key: _scaffoldKey,
              drawer: Drawer(
                  child: new ListView(
                children: <Widget>[
                  new DrawerHeader(
                    child: new Text("Stations",
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
                    title: new Text("Station 1",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctxt) => new FirstPage()));
                    },
                  ),
                  new ListTile(
                    title: new Text("Station 2",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctxt) => new SecondPage()));
                    },
                  ),
                  new ListTile(
                    title: new Text("Station 3",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctxt) => new ThirdPage()));
                    },
                  ),
                  new ListTile(
                    title: new Text("Station 4",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctxt) => new FourPage()));
                    },
                  ),
                  new ListTile(
                    title: new Text("Station 5",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctxt) => new ThursPage()));
                    },
                  ),
                  new ListTile(
                    title: new Text("Station 6",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctxt) => new SixthPage()));
                    },
                  ),
                  new ListTile(
                    title: new Text("Station 7",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctxt) => new SeventhPage()));
                    },
                  ),
                  new ListTile(
                    title: new Text("Station 8",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctxt) => new EighthPage()));
                    },
                  ),
                  new ListTile(
                    title: new Text("Station 9",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctxt) => new NinthPage()));
                    },
                  ),
                  new ListTile(
                    title: new Text("Station 10",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctxt) => new TenthPage()));
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
                                DateFormat.yMEd()
                                    .add_jms()
                                    .format(DateTime.now()),
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
                      //         value ? Text("Enable Alerts") : Text("Disable Alert"),
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
            )));
  }

  // Future<void> writeData() async {
  //   dbRef.child("LightState").set({"switch": !value});
  // }
}
