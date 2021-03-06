import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movies_app/src/providers/movie_providers.dart';
import 'package:movies_app/src/redux/storage.dart';
import 'package:movies_app/src/widgets/card_swiper_widget.dart';
import 'package:movies_app/src/widgets/horizontal_movies.dart';

import '../redux/storage.dart';
import 'package:redux/src/store.dart';
import '../redux/storage.dart';
import '../widgets/horizontal_movies.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final moviesProvider = MovieProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
        centerTitle: false,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_swiperCard(), _footer(context)],
      )),
    );
  }

  Widget _swiperCard() {
    moviesProvider.getNowPlaying();

    return FutureBuilder(
        future: moviesProvider.getNowPlaying(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return CardSwiper(movies: snapshot.data);
          } else {
            return Container(
                height: 350.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ));
          }
        });
  }

  Widget _footer(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Populars',
                    style: Theme.of(context).textTheme.subtitle1,
                  )),
              StoreConnector<AppState, Store<AppState>>(
                distinct: true,
                converter: (store) => store,
                rebuildOnChange: false,
                builder: (context, store) {
                  return store.state == null
                      ? CircularProgressIndicator()
                      : MoviesHorizontal(
                          movies: store.state.moviesState.movies,
                          action: () {
                            setState(() {});
                          });
                },
              ),
            ],
          )),
    );
  }
}
