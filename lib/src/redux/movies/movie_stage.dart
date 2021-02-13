
import 'package:movies_app/src/models/movie_model.dart';
import 'package:meta/meta.dart';

@immutable
class MoviesState {
  final bool isError;
  final bool isLoading;
  final List<Movie> movies;

  MoviesState({
    this.isError,
    this.isLoading,
    this.movies
  });

  factory MoviesState.initial() => MoviesState(
      isError: false,
      isLoading: false,
      movies: const [],
    );

  MoviesState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required List<Movie> movies,
  }) {
    return MoviesState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      movies: movies ?? this.movies,
    );
  }
}