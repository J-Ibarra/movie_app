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
    bloc.getAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text("App Movie"),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<MovieRespose> snapshot) {
          if (snapshot.hasData) {
            return list(snapshot.data);
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Widget list(MovieRespose response) {
  return GridView.builder(
    itemCount: response.data.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (BuildContext context, int index) {
      return Image.network(response.data[index].imageUrl,
        fit: BoxFit.cover,
      );
    },
  );
}
