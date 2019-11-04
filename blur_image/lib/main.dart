import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

void main() => runApp(App());

class AppState extends State<App> {

  bool _isBlurred = false; 

    @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Blur Image", 
      home: Scaffold(
        appBar: AppBar(
          title: Text("Blur Image")
        ), 
      body: Stack(
        children: <Widget>[
          Image.asset("images/cat.png"),
          BackdropFilter(
            filter: prefix0.ImageFilter.blur(sigmaX: _isBlurred ? 5 : 0, sigmaY: _isBlurred ? 5 : 0), 
            child: Container(
              color: Colors.black.withOpacity(0)
            )
          ),
          Center(
            child: Switch(
              onChanged: (value) {
                setState(() {
                  _isBlurred = value; 
                });
              },
              value: _isBlurred 
            ),
          )
        ],
      )
      )
    );
  }

}

class App extends StatefulWidget {

  @override 
  createState() => AppState();

}
