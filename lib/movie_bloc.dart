import 'package:rxdart/rxdart.dart';

import 'movie_model.dart';
import 'movie_repository.dart';

class MoviesBloc {
  final _repository = MovieRepository();
  final _moviesFetcher = PublishSubject<List<Movie>>();

  List<Movie> list = [];

  bool loading = false;

  int page = 0;

  Stream<List<Movie>> get allMovies => _moviesFetcher.stream;

  dispose() {
    _moviesFetcher.close();
  }

  getMoreData() async {
    loading = true;
    print(page);
    MovieRespose itemModel = await _repository.getAllMovies(++page);
    list.addAll(itemModel.data);
    _moviesFetcher.sink.add(list);
    loading = false;
  }
}
