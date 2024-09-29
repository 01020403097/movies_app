import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_sources/remote_data_source/popular_movies_data_source.dart';
import 'package:movies_app/domain/entities/popular_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';
import 'package:movies_app/domain/repository/popular_movies_repository.dart';

@injectable
class PopularMoviesRepositoryImpl implements PopularMoviesRepository {
  PopularMoviesDataSource popularMoviesDataSource;

  PopularMoviesRepositoryImpl({required this.popularMoviesDataSource});

  @override
  Future<Either<Failures, PopularMoviesEntity>> popularMovies() async {
    var either = await popularMoviesDataSource.popularMovies();

    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }
}
