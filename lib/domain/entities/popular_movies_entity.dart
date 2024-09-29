class PopularMoviesEntity {
  PopularMoviesEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.statusMessage
  });

  num? page;
  List<ResultsEntity>? results;
  num? totalPages;
  num? totalResults;
  String? statusMessage;
}

class ResultsEntity {
  ResultsEntity({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
}
