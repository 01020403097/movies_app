import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_sources/remote_data_source/upcoming_movies_data_source.dart';
import 'package:movies_app/domain/entities/upcoming_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';
import 'package:movies_app/domain/repository/upcoming_movies_repository.dart';

@injectable
class UpcomingMoviesRepositoryImpl implements UpcomingMoviesRepository {
  UpcomingMoviesDataSource upcomingMoviesDataSource;

  UpcomingMoviesRepositoryImpl({required this.upcomingMoviesDataSource});

  @override
  Future<Either<Failures, UpcomingMoviesEntity>> upcomingMovies() async {
    var either = await upcomingMoviesDataSource.upcomingMovies();

    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }
}
