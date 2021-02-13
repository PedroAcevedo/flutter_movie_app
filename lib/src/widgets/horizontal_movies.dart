import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';

class MoviesHorizontal extends StatelessWidget {
  final List<Movie> movies;

  const MoviesHorizontal({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        controller: PageController(initialPage: 1, viewportFraction: 0.3),
        children: _cards(context),
      ),
    );
  }

  List<Widget> _cards(BuildContext context) {
    return movies.map((movie) {
      if(movie != null){
      return Container(
        width: 120.0,
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
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
