import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/popular_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';

abstract class PopularMoviesRepository {
  Future<Either<Failures, PopularMoviesEntity>> popularMovies();
}