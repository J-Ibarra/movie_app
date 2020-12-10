class MovieRespose {
  int _page;
  int _totalPages;
  int _totalResult;
  List<Movie> _results;

  MovieRespose.fromJson(json) {
    _page = json['page'];
    _totalPages = json['total_pages'];
    _totalResult = json['total_results'];
    _results = [];
    for (int i = 0; i < json['results'].length; i++) {
      var item = json['results'][i];
      Movie movie = Movie(item);
      _results.add(movie);
    }
  }

  int get page => _page;

  int get totalPages => _totalPages;

  int get totalResult => _totalResult;

  List<Movie> get data => _results;
}

class Movie {
  int _voteCount;
  int _id;
  bool _video;
  var _voteAverage;
  String _title;
  double _popularity;
  String _posterPath;
  String _originalLanguage;
  String _originalTitle;
  List<int> _genreIds = [];
  String _backdropPath;
  bool _adult;
  String _overview;
  String _releaseDate;

  Movie(item) {
    _voteCount = item['vote_count'];
    _id = item['id'];
    _video = item['video'];
    _voteAverage = item['vote_average'];
    _title = item['title'];
    _popularity = item['popularity'];
    _posterPath = item['poster_path'];
    _originalLanguage = item['original_language'];
    _originalTitle = item['original_title'];
    for (int i = 0; i < item['genre_ids'].length; i++) {
      _genreIds.add(item['genre_ids'][i]);
    }
    _backdropPath = item['backdrop_path'];
    _adult = item['adult'];
    _overview = item['overview'];
    _releaseDate = item['release_date'];
  }

  String get imageUrl => 'https://image.tmdb.org/t/p/w185$posterPath';

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  double get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;
}
