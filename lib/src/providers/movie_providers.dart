import 'dart:convert';

import 'package:movies_app/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  String _apiKey = 'fcfdaf7216ef72a6773180f704782eb4';
  String _url = 'api.themoviedb.org';
  String _language = 'en-US';

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    final resp = await http.get(url);
    final decodedResp = json.decode(resp.body);

    final movies = Movies.fromJsonList(decodedResp['results']);

    return movies.items;
  }

  String getPopulars() {
    return Uri.https(_url, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language}).toString();
  }
}
