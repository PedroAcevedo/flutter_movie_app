import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movies_app/src/pages/home_page.dart';
import 'package:movies_app/src/redux/storage.dart';

import 'src/providers/movie_providers.dart';

void main() async {
  await Redux.init();
  await MovieProvider().getPopulars(Redux.store);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: Redux.store,
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
