import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/top_rated_movies_entity.dart';

import '../failures.dart';

abstract class TopRatedMoviesRepository {
  Future<Either<Failures, TopRatedMoviesEntity>> topRatedMovies();
}
