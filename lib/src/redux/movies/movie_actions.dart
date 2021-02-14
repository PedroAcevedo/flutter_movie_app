import 'package:meta/meta.dart';

import '../../models/movie_model.dart';

@immutable
class SetMoviesStateAction {
  final Movies movies;

  SetMoviesStateAction(this.movies);
}

class IsLoadingAction {
  IsLoadingAction();
}

class OnErrorMovieAction {
  OnErrorMovieAction();
}

class UpdateMovieStream {
  final Movies movies;

  UpdateMovieStream(this.movies);
}
