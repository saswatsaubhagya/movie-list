import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

import '../utils/appstate.dart';
import '../models/movie.dart';

class Movies with ChangeNotifier {
  AppState _state = AppState.Idle;
  AppState get state => _state;
  void setState(AppState appState) {
    _state = appState;
    notifyListeners();
  }

  Movie _movies = new Movie();
  Movie get movies => _movies;

  Future<Movie> getMovieList({String titel}) async {
    setState(AppState.Busy);
    var connectivityResult = await (Connectivity().checkConnectivity());
    try {
      _movies = new Movie();
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var responce =
            await http.get('http://www.omdbapi.com/?apikey=fde6a5f8&t=$titel');
        if (responce.statusCode == 200) {
          _movies = Movie.fromJson(json.decode(responce.body));
        }
      }
    } catch (e) {
      setState(AppState.Idle);
      print(e);
    }
    setState(AppState.Idle);
    return _movies;
  }
}
