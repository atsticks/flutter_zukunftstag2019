import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start Counter',
      theme: ThemeData(
        // application has a blue toolbar.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Start Counter Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final AudioCache audioCache = AudioCache();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  playRestore() {
    audioCache.play("audio/laughing_crowd.wav");
  }

  playAlarm() {
    audioCache.play("audio/modern_phone1.wav");
  }

  playStart() {
    audioCache.play("audio/door_slam_1.wav");
  }

  addAny(){
    setState(() {
      _counter += Random().nextInt(1000);
    });
    audioCache.play("audio/crowd2.wav", volume: 0.5);
  }

  @override
  Widget build(BuildContext context) {

    audioCache.load("audio/door_slam_1.wav");
    audioCache.load("audio/modern_phone1.wav");
    audioCache.load("audio/laughing_crowd.wav");
    audioCache.load("audio/crowd2.wav");

    TextStyle style = TextStyle(color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text(widget.title),
        actions: <Widget>[IconButton(icon: Icon(Icons.message)),IconButton(icon: Icon(Icons.email),)],
    ),
      body:  Stack(children: <Widget>[
        Column(children: <Widget>[
          Column(children:[
            Image.asset("assets/images/start.jpg", fit: BoxFit.scaleDown),
            SizedBox(height: 50),
            Text(
              'Es war cool heute und en Guete!:',
              style: style,
            ),
          ]),
        ],),
        Text(
          'Wir starteten $_counter Male.',
          style: style,
        ),
       ]),
      drawer:  Stack(
          children:[
        Image.asset("assets/images/startStop.png", fit: BoxFit.fill),
        SizedBox(height: 50),
        Text(
          'Trivadis ist cool.',
          style: style,
        ),
      ]),
      bottomNavigationBar: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
        IconButton(color: Colors.white, icon: Icon(Icons.restore),tooltip: "Restore",onPressed: playRestore,),
        IconButton(color: Colors.white, icon: Icon(Icons.access_alarm),tooltip: "Alarm",onPressed: playAlarm,),
        IconButton(color: Colors.white, icon: Icon(Icons.help),tooltip: "Add Any",onPressed: addAny,),
      ]),
      bottomSheet:  Text("This application was developed for the Swiss Zukunftstag at Trivadis AG. (C) by all the geeks reading this!"),
      backgroundColor: Colors.black87,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
  }
}
