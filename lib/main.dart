import 'package:flutter/material.dart';
import 'package:movie_app/movie_bloc.dart';
import 'package:movie_app/movie_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MovieList(),
    );
  }
}

class MovieList extends StatelessWidget {
  final bloc = MoviesBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Movie"),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return list(snapshot.data, bloc);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            bloc.getMoreData();
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget list(List<Movie> response, MoviesBloc bloc) {
  return NotificationListener<ScrollNotification>(
    onNotification: (notification) {
      if (notification.metrics.pixels == notification.metrics.maxScrollExtent && !bloc.loading) {
        bloc.getMoreData();
      }
      return true;
    },
    child: GridView.builder(
      itemCount: response.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          response[index].imageUrl,
          fit: BoxFit.cover,
        );
      },
    ),
  );
}
