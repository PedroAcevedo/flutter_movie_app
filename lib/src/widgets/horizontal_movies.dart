import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';

import '../providers/movie_providers.dart';
import '../redux/storage.dart';

class MoviesHorizontal extends StatefulWidget {
  final List<Movie> movies;
  final Function action;

  const MoviesHorizontal({@required this.movies, @required this.action});

  @override
  _MoviesHorizontalState createState() => _MoviesHorizontalState();
}

class _MoviesHorizontalState extends State<MoviesHorizontal> {
  int _pagesMovies = 1;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    final PageController _pageController =
        PageController(initialPage: 1, viewportFraction: 0.3);

    _pageController.addListener(() async {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        _pagesMovies++;
        MovieProvider().getPopulars(Redux.store, pagesMovie: _pagesMovies);
        widget.action();
      }
    });

    return Container(
      height: _screenSize.height * 0.25,
      child: PageView(
        controller: _pageController,
        children: _cards(context),
      ),
    );
  }

  List<Widget> _cards(BuildContext context) {
    return widget.movies.map((movie) {
      if (movie != null) {
        return Container(
          width: 120.0,
          margin: EdgeInsets.only(
            right: 10.0,
          ),
          padding: EdgeInsets.all(
            5.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(movie.getPosterImage()),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        );
      }
    }).toList();
  }
}
