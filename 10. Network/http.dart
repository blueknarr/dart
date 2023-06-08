import 'dart:convert';

import 'package:day1/http/model/MovieDetail.dart';
import 'package:http/http.dart' as http;

import 'model/movie.dart';

Future<List<Movie>> getMovies() async {
  final http.Response response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));
  List<dynamic> jsonList = jsonDecode(response.body)['results'];
  return jsonList.map((e) => Movie.fromJson(e)).toList();
}

Future<MovieDetail> getMovieDetail(int movieId) async {
  final http.Response response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/${movieId}?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));
  final json = jsonDecode(response.body);
  return MovieDetail.fromJson(json);
}

void main() async {
  final movies = await getMovies();
  print(movies);
  print(movies[0].title);

  final movieDetail = await getMovieDetail(569094);
  print(movieDetail);
  print(movieDetail.title);
}
