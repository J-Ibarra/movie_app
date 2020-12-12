
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:movie_app/movie_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '4b70732d5b54a8e0683258eadc4aa460';

    Future<MovieRespose> fetchMovieList(int page) async {
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&page=$page");
    if (response.statusCode == 200) {
      return MovieRespose.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
