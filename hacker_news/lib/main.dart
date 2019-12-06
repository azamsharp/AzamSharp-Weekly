import 'package:flutter/material.dart';
import 'package:hacker_news/pages/homePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Hacker News", 
      home: HomePage()
    );
    
  }

}
