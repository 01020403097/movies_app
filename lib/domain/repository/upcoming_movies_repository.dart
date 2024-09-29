import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/upcoming_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';

abstract class UpcomingMoviesRepository {
  Future<Either<Failures,UpcomingMoviesEntity>> upcomingMovies();
}
