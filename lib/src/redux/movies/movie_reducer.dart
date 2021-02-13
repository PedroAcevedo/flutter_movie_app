


import 'package:movies_app/src/redux/movies/movie_actions.dart';
import 'package:movies_app/src/redux/movies/movie_stage.dart';

movieReducer(MoviesState prevState, SetMoviesStateAction action) {

  final payload = action.moviesState;
  return prevState.copyWith(isError: payload.isError, isLoading: payload.isLoading, movies: payload.movies);

}