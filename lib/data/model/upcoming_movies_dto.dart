import 'package:movies_app/domain/entities/upcoming_movies_entity.dart';

class UpcomingMoviesDto extends UpcomingMoviesEntity {
  UpcomingMoviesDto(
      {super.dates,
      super.page,
      super.results,
      super.totalPages,
      super.totalResults,
      super.statusMessage});

  UpcomingMoviesDto.fromJson(dynamic json) {
    dates = json['dates'] != null ? DatesDto.fromJson(json['dates']) : null;
    page = json['page'];
    statusMessage = json['statusMessage'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ResultsDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    statusMessage = json['statusMessage'];
  }
}

class ResultsDto extends ResultsEntity {
  ResultsDto({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  ResultsDto.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}

class DatesDto extends DatesEntity {
  DatesDto({
    super.maximum,
    super.minimum,
  });

  DatesDto.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;
    return map;
  }
}
