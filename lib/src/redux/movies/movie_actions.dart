import 'dart:async';

import 'package:meta/meta.dart';
import 'package:movies_app/src/providers/movie_providers.dart';
import 'package:movies_app/src/redux/movies/movie_stage.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:movies_app/src/redux/storage.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

@immutable
class SetMoviesStateAction {
  final MoviesState moviesState;

  SetMoviesStateAction(this.moviesState);
}


const LIST_USERS_REQUEST = 'LIST_USERS_REQUEST';
const LIST_USERS_SUCCESS = 'LIST_USERS_SUCCESS';
const LIST_USERS_FAILURE = 'LIST_USERS_FAILURE';

MovieProvider movieProvider = MovieProvider();

var action  = {
    RSAA : {
      'method': 'GET',
      'endpoint': movieProvider.getPopulars(),
      'types': [
        LIST_USERS_REQUEST,
        LIST_USERS_SUCCESS,
        LIST_USERS_FAILURE,
      ],
      'headers': {
        'Content-Type': 'application/json',
      },
    }
};


ThunkAction<AppState> getPopulars() => (Store<AppState> store) => store.dispatch(action);