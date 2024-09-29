import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/popular_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';
import 'package:movies_app/domain/repository/popular_movies_repository.dart';

@injectable
class PopularMoviesUseCase {
  PopularMoviesRepository popularMoviesRepository;

  PopularMoviesUseCase({required this.popularMoviesRepository});

  Future<Either<Failures, PopularMoviesEntity>> invoke() async {
    return await popularMoviesRepository.popularMovies();
  }
}