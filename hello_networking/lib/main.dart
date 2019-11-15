import 'package:flutter/material.dart';
import 'package:hello_networking/movie.dart';
import 'package:hello_networking/webservice.dart';
import 'package:hello_networking/webservice.dart' as prefix0;
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(
      builder: (context) => Webservice(),
      child: App()
    ));

class App extends StatefulWidget {

  @override 
  _AppState createState() => _AppState(); 

}

class _AppState extends State<App> {

  final webservice = Webservice(); 

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() async {
      await this.webservice.loadMovies(); 
  }

  @override
  Widget build(BuildContext context) {

    final ws = Provider.of<Webservice>(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Movies")
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
                        this.webservice.toggleState(); // does not work 
                       // Webservice().loadMovies(); // does not work 
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