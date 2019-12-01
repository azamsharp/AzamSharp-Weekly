import 'package:flutter/material.dart';
import 'package:hello_networking/webservice.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider<Webservice>(
      builder: (context) => Webservice(),
      child: App()
    ));


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final ws = Provider.of<Webservice>(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("${ws.value}")
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: ws.movies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(ws.movies[index].poster),
                  title: Text(ws.movies[index].title)
                );
              },
            ),
            SafeArea(
                  child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                    onPressed: () {
                        //ws.toggleState(); // does not work 
                        ws.loadMovies(); // does not work 
                    }, 
                    child: Icon(Icons.refresh),
                ),
                  ),
              ),
            )
          ],
        )
      )
    );
    
  }

}