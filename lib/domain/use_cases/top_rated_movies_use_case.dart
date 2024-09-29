import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/top_rated_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';

import '../repository/top_rated_movies_repository.dart';

@injectable
class TopRatedMoviesUseCase {
  TopRatedMoviesRepository topRatedMoviesRepository;
  TopRatedMoviesUseCase({required this.topRatedMoviesRepository});

  Future<Either<Failures, TopRatedMoviesEntity>> invoke() async{
    return await topRatedMoviesRepository.topRatedMovies();
  }
}