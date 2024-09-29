import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository/upcoming_movies_repository.dart';
import 'package:movies_app/domain/entities/upcoming_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';

@injectable
class UpcomingMoviesUseCase {
  UpcomingMoviesRepository upcomingMoviesRepository;
  UpcomingMoviesUseCase({required this.upcomingMoviesRepository});

  Future<Either<Failures, UpcomingMoviesEntity>> invoke() async{
    return await upcomingMoviesRepository.upcomingMovies();
  }
 }