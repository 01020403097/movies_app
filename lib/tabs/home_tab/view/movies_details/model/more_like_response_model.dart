class SimilarMoviesResponse {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  SimilarMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SimilarMoviesResponse.fromJson(Map<String, dynamic> json) {
    var resultsList = json['results'] as List;
    List<Movie> results = resultsList.map((i) => Movie.fromJson(i)).toList();

    return SimilarMoviesResponse(
      page: json['page'],
      results: results,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Movie {
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String releaseDate;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      overview: json['overview'],
      releaseDate: json['release_date'] ?? '',
    );
  }
}
