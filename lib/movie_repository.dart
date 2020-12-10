import 'package:movie_app/movie_api_provider.dart';
import 'package:movie_app/movie_model.dart';

class MovieRepository {
  final apiProvider = MovieApiProvider();

  Future<MovieRespose> getAllMovies() => apiProvider.fetchMovieList();
}
