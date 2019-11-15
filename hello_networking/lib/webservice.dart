
import 'dart:convert';


import 'package:hello_networking/movie.dart';
import 'package:http/http.dart' as http;

class Webservice {

  Future<List<Movie>> loadMovies() async {

    String url = "http://www.omdbapi.com/?s=batman&apikey=564727fa"; 
    final response = await http.get(url);

    if(response.statusCode == 200) {

      final json = jsonDecode(response.body); 
      final Iterable list = json["Search"];
      return list.map((item) => Movie.fromJSON(item)).toList();

    } else {
      throw Exception("Error loading movies...");
    }
  }

}