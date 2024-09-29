import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_sources/remote_data_source/top_rated_movies_data_source.dart';
import 'package:movies_app/domain/entities/top_rated_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';
import 'package:movies_app/domain/repository/top_rated_movies_repository.dart';

@injectable
class TopRatedMoviesRepositoryImpl implements TopRatedMoviesRepository {
  TopRatedMoviesDataSource topRatedMoviesDataSource;

  TopRatedMoviesRepositoryImpl({required this.topRatedMoviesDataSource});

  @override
  Future<Either<Failures, TopRatedMoviesEntity>> topRatedMovies() async {
    var either = await topRatedMoviesDataSource.topRatedMovies();

    return either.fold(
          (error) => Left(error),
          (response) => Right(response),
    );
  }
}
