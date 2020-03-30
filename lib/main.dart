import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/moviesearch.dart';
import './utils/appprovider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Assignment',
        theme: ThemeData(primaryColor: Colors.black),
        home: MovieSearchPage(),
      ),
    );
  }
}
