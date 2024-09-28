import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/top_rated_movies_entity.dart';
import '../../../domain/failures.dart';

abstract class TopRatedMoviesDataSource {
  Future<Either<Failures, TopRatedMoviesEntity>> topRatedMovies();
}
