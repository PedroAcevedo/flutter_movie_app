import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:movies_app/src/redux/movies/movie_reducer.dart';
import 'package:movies_app/src/redux/movies/movie_stage.dart';

AppState appReducer(AppState state, dynamic action) {
  final nextPostsState = movieReducer(state.moviesState, action);
  return state.copyWith(moviesState: nextPostsState);
}

@immutable
class AppState {
  final MoviesState moviesState;

  AppState({
    @required this.moviesState,
  });

  AppState copyWith({MoviesState moviesState}) {
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
    _store = Store<AppState>(
      appReducer,
      initialState: AppState(moviesState: new MoviesState.initial()),
    );
  }
}
