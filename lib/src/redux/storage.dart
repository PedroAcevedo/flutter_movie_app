import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:movies_app/src/redux/movies/movie_actions.dart';
import 'package:movies_app/src/redux/movies/movie_reducer.dart';
import 'package:movies_app/src/redux/movies/movie_stage.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetMoviesStateAction) {
    final nextPostsState = movieReducer(state.moviesState, action);

    return state.copyWith(postsState: nextPostsState);
  }
}

@immutable
class AppState {
  final MoviesState moviesState;

  AppState({
    @required this.moviesState,
  });

  AppState copyWith({MoviesState postsState}) {
    return AppState(
      moviesState: moviesState ?? this.moviesState,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final moviesStateInitial = MoviesState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(moviesState: moviesStateInitial),
    );
  }
}
