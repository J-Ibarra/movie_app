import 'package:rxdart/rxdart.dart';

import 'movie_model.dart';
import 'movie_repository.dart';

class MoviesBloc {
  final _repository = MovieRepository();
  final _moviesFetcher = PublishSubject<MovieRespose>();

  Stream<MovieRespose> get allMovies => _moviesFetcher.stream;

  getAllMovies() async {
    MovieRespose itemModel = await _repository.getAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}
