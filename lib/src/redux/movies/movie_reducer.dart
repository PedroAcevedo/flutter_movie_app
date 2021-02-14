import 'package:movies_app/src/redux/movies/movie_actions.dart';
import 'package:movies_app/src/redux/movies/movie_stage.dart';
import 'movie_actions.dart';

movieReducer(MoviesState prevState, dynamic action) {

  print(action);

  if (action is IsLoadingAction) {
    return prevState.copyWith(isError: false, isLoading: true, movies: null);
  } else {
    if (action is OnErrorMovieAction) {
      return prevState.copyWith(isError: true, isLoading: false, movies: null);
    } else {
      if (action is SetMoviesStateAction) {
        return prevState.copyWith(
            isError: false, isLoading: false, movies: action.movies.items);
      }else{
        if(action is UpdateMovieStream){
          return prevState.copyWith(
            isError: false, isLoading: false, movies: [...prevState.movies, ...action.movies.items]);
        }
      }
    }
  }
}
