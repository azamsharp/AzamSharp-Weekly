import 'package:flutter/material.dart';
import 'package:hello_networking/movie.dart';
import 'package:hello_networking/webservice.dart';

void main() => runApp(App());

class App extends StatefulWidget {

  @override 
  _AppState createState() => _AppState(); 

}

class _AppState extends State<App> {

  List<Movie> _movies = List<Movie>(); 

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() async {
    final results = await Webservice().loadMovies();
    setState(() {
      _movies = results; 
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Movies")
        ),
        body: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(_movies[index].poster),
              title: Text(_movies[index].title)
            );
          },
        )
      )
    );
    
  }

}