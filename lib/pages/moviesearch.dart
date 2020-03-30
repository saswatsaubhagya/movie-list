import 'package:assignment/utils/appstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/movies.dart';

class MovieSearchPage extends StatefulWidget {
  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  var textcontroller = new TextEditingController();
  String genreBuilder({String value}) {
    String finaldata = "";
    for (var item in value.split(',')) {
      finaldata = finaldata + (item + " | ");
    }
    return finaldata;
  }

  @override
  Widget build(BuildContext context) {
    var movieprovider = Provider.of<Movies>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search For movies",
                  border: OutlineInputBorder(),
                  fillColor: Colors.black),
              controller: textcontroller,
              onEditingComplete: () {
                movieprovider.getMovieList(titel: textcontroller.text);
              },
            ),
            Consumer<Movies>(builder: (context, data, _) {
              return data.state == AppState.Busy
                  ? Center(child: CircularProgressIndicator())
                  : (data.movies.title?.isEmpty ?? true)
                      ? SizedBox()
                      : Card(
                          margin: EdgeInsets.only(top: 10),
                          elevation: 4.0,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Container(
                                  height: size.height/5,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(data.movies.poster),
                                  )),
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                fit: FlexFit.tight,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      data.movies.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      genreBuilder(value: data.movies.genre),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            data.movies.imdbRating + " IMDB",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
            })
          ],
        ),
      ),
    );
  }
}
