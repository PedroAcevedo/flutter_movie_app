import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movies_app/src/pages/home_page.dart';
import 'package:movies_app/src/redux/storage.dart';

void main() async {
  await Redux.init();
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
