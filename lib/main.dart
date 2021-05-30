import 'dart:async';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/gestures.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

// class StreamSocket {
//   final _socketResponse = StreamController<String>();

//   void Function(String) get addResponse => _socketResponse.sink.add;

//   Stream<String> get getResponse => _socketResponse.stream;

//   void dispose() {
//     _socketResponse.close();
//   }
// }
//tram1
var value1 = "";
var value2 = "";
var value3 = "";
var value4 = "";
var value5 = "";

//tram2
var value6 = "";
var value7 = "";
var value8 = "";
var value9 = "";
var value10 = "";

//tram3
var value11 = "";
var value12 = "";
var value13 = "";
var value14 = "";
var value15 = "";

//tram4
var value16 = "";
var value17 = "";
var value18 = "";
var value19 = "";
var value20 = "";

//tram5
var value21 = "";
var value22 = "";
var value23 = "";
var value24 = "";
var value25 = "";

//tram6
var value26 = "";
var value27 = "";
var value28 = "";
var value29 = "";
var value30 = "";
//flag
bool temp1;
// StreamSocket streamSocket = StreamSocket();
void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

//STEP2: Add this function in main function in main.dart file and add incoming data to the stream

  IO.Socket socket = IO.io('https://rewes.glitch.me',
      OptionBuilder().setTransports(['websocket']).build());

  socket.onConnect((_) {
    temp1 = true;
    print('connect');
  });

  //When an event recieved from server, data is added to the stream
  //tram1
  socket.on('temptoapp', (data) => {value1 = data});
  socket.on('tempto1app', (data) => {value2 = data});
  socket.on('tempto3app', (data) => {value4 = data});
  socket.on('tempto2app', (data) => {value3 = data});
  socket.on('tempto4app', (data) => {value5 = data});
  //tram2
  socket.on('tempto5app', (data) => {value6 = data});
  socket.on('tempto6app', (data) => {value7 = data});
  socket.on('tempto7app', (data) => {value8 = data});
  socket.on('tempto8app', (data) => {value9 = data});
  socket.on('tempto9app', (data) => {value10 = data});
  //tram3
  socket.on('tempto10app', (data) => {value11 = data});
  socket.on('tempto11app', (data) => {value12 = data});
  socket.on('tempto12app', (data) => {value13 = data});
  socket.on('tempto13app', (data) => {value14 = data});
  socket.on('tempto14app', (data) => {value15 = data});
  //tram4
  socket.on('tempto15app', (data) => {value16 = data});
  socket.on('tempto16app', (data) => {value17 = data});
  socket.on('tempto17app', (data) => {value18 = data});
  socket.on('tempto18app', (data) => {value19 = data});
  socket.on('tempto19app', (data) => {value20 = data});
  //tram5
  socket.on('tempto20app', (data) => {value21 = data});
  socket.on('tempto21app', (data) => {value22 = data});
  socket.on('tempto22app', (data) => {value23 = data});
  socket.on('tempto23app', (data) => {value24 = data});
  socket.on('tempto24app', (data) => {value25 = data});
  //tram6
  socket.on('tempto25app', (data) => {value26 = data});
  socket.on('tempto26app', (data) => {value27 = data});
  socket.on('tempto27app', (data) => {value28 = data});
  socket.on('tempto28app', (data) => {value29 = data});
  socket.on('tempto29app', (data) => {value30 = data});

  socket.onDisconnect((_) => {temp1 = false, print('disconnect')});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{},
      title: 'REWES',
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => IotScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/logoRE.png',
            height: 100.0,
          ),
          SizedBox(height: 30.0),
          SpinKitRipple(color: Colors.red),
        ],
      ),
    );
  }
}

class SecondPagez1 extends StatefulWidget {
  @override
  _SecondPagez1 createState() => _SecondPagez1();
}

class _SecondPagez1 extends State<SecondPagez1>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(milliseconds: 100)),
                builder: (context, snapshot) {
                  if (value1 == "") {
                    return Column(children: [
                      SizedBox(height: 20),
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
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]);
                  } else {
                    return StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          if (temp1 == true && value1 != 'disconnected') {
                            return Column(children: [
                              SizedBox(height: 20),
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
                                        child: Text(value1 + " °C",
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
                                        child: Text(value2 + " %",
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
                                        child: Text(value3 + "",
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
                                        child: Text(value4 + " uSv/h",
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
                                        child: Text(value5 + "",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
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
                                            color: Colors.yellow)),
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
                          } else {
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
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]));
                          }
                        });
                  }
                })));
  }
}

class SecondPagez2 extends StatefulWidget {
  @override
  _SecondPagez2 createState() => _SecondPagez2();
}

class _SecondPagez2 extends State<SecondPagez2>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(milliseconds: 100)),
                builder: (context, snapshot) {
                  if (value6 == "") {
                    return Column(children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
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
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]);
                  } else {
                    return StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          if (temp1 == true && value6 != 'disconnected') {
                            return Column(children: [
                              SizedBox(height: 20),
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
                                        child: Text(value6 + " °C",
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
                                        child: Text(value7 + " %",
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
                                        child: Text(value8 + "",
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
                                        child: Text(value9 + " uSv/h",
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
                                        child: Text(value10 + "",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
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
                                            color: Colors.yellow)),
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
                          } else {
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
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]));
                          }
                        });
                  }
                })));
  }
}

class SecondPagez3 extends StatefulWidget {
  @override
  _SecondPagez3 createState() => _SecondPagez3();
}

class _SecondPagez3 extends State<SecondPagez3>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(milliseconds: 100)),
                builder: (context, snapshot) {
                  if (value11 == "") {
                    return Column(children: [
                      SizedBox(height: 20),
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
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]);
                  } else {
                    return StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          if (temp1 == true && value11 != 'disconnected') {
                            return Column(children: [
                              SizedBox(height: 20),
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
                                        child: Text(value11 + " °C",
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
                                        child: Text(value12 + " %",
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
                                        child: Text(value13 + "",
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
                                        child: Text(value14 + " uSv/h",
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
                                        child: Text(value15 + "",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
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
                                            color: Colors.yellow)),
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
                          } else {
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
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]));
                          }
                        });
                  }
                })));
  }
}

class SecondPagez4 extends StatefulWidget {
  @override
  _SecondPagez4 createState() => _SecondPagez4();
}

class _SecondPagez4 extends State<SecondPagez4>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(milliseconds: 100)),
                builder: (context, snapshot) {
                  if (value16 == "") {
                    return Column(children: [
                      SizedBox(height: 20),
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
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]);
                  } else {
                    return StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          if (temp1 == true && value16 != 'disconnected') {
                            return Column(children: [
                              SizedBox(height: 20),
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
                                        child: Text(value16 + " °C",
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
                                        child: Text(value17 + " %",
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
                                        child: Text(value18 + "",
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
                                        child: Text(value19 + " uSv/h",
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
                                        child: Text(value20 + "",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
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
                                            color: Colors.yellow)),
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
                          } else {
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
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]));
                          }
                        });
                  }
                })));
  }
}

class SecondPagez5 extends StatefulWidget {
  @override
  _SecondPagez5 createState() => _SecondPagez5();
}

class _SecondPagez5 extends State<SecondPagez5>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(milliseconds: 100)),
                builder: (context, snapshot) {
                  if (value21 == "") {
                    return Column(children: [
                      SizedBox(height: 20),
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
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]);
                  } else {
                    return StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          if (temp1 == true && value21 != 'disconnected') {
                            return Column(children: [
                              SizedBox(height: 20),
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
                                        child: Text(value21 + " °C",
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
                                        child: Text(value22 + " %",
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
                                        child: Text(value23 + "",
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
                                        child: Text(value24 + " uSv/h",
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
                                        child: Text(value25 + "",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
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
                                            color: Colors.yellow)),
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
                          } else {
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
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]));
                          }
                        });
                  }
                })));
  }
}

class SecondPagez6 extends StatefulWidget {
  @override
  _SecondPagez6 createState() => _SecondPagez6();
}

class _SecondPagez6 extends State<SecondPagez6>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(milliseconds: 100)),
                builder: (context, snapshot) {
                  if (value26 == "") {
                    return Column(children: [
                      SizedBox(height: 20),
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
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]);
                  } else {
                    return StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          if (temp1 == true && value26 != 'disconnected') {
                            return Column(children: [
                              SizedBox(height: 20),
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
                                        child: Text(value26 + " °C",
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
                                        child: Text(value27 + " %",
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
                                        child: Text(value28 + "",
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
                                        child: Text(value29 + " uSv/h",
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
                                        child: Text(value30 + "",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
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
                                            color: Colors.yellow)),
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
                          } else {
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
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]));
                          }
                        });
                  }
                })));
  }
}

class IotScreen extends StatefulWidget {
  @override
  _IotScreenState createState() => _IotScreenState();
}

class FirstPage extends StatelessWidget {
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

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

class SixthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                              builder: (ctxt) => new FourthPage()));
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
                              builder: (ctxt) => new FifthPage()));
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
