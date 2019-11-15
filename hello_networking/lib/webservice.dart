
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:hello_networking/movie.dart';
import 'package:http/http.dart' as http;

class Webservice extends ChangeNotifier {

  List<Movie> movies = List<Movie>(); 

  void toggleState() {
    notifyListeners(); 
  }

  Future<void> loadMovies() async {

    String url = "http://www.omdbapi.com/?s=batman&apikey=564727fa"; 
    final response = await http.get(url);

    if(response.statusCode == 200) {

      final json = jsonDecode(response.body); 
      final Iterable list = json["Search"];
      this.movies = list.map((item) => Movie.fromJSON(item)).toList();
      debugPrint("${this.movies}");
      notifyListeners(); 

    } else {
      throw Exception("Error loading movies...");
    }
  }

}