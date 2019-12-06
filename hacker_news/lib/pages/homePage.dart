import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _buildScaffold(Widget root) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
          child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              backgroundColor: Colors.orange,
              largeTitle:
                  Text("Hacker News", style: TextStyle(color: Colors.white)),
            )
          ];
        },
        body: root,
      ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Hacker News")
        ),
        body: root 
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(Text("Hello World"));

  }
}
