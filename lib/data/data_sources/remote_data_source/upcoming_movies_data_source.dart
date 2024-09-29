import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/upcoming_movies_entity.dart';

import '../../../domain/failures.dart';

abstract class UpcomingMoviesDataSource {
  Future<Either<Failures,UpcomingMoviesEntity>> upcomingMovies();

}