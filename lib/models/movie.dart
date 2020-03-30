class Movie {
  String title;
  String genre;
  String imdbRating;
  String poster;

  Movie({this.title, this.genre, this.imdbRating, this.poster});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    genre = json['Genre'];
    imdbRating = json['imdbRating'];
    poster = json['Poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Genre'] = this.genre;
    data['imdbRating'] = this.imdbRating;
    data['Poster'] = this.poster;
    return data;
  }
}
