import 'package:movies_app/domain/entities/upcoming_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';

abstract class UpcomingMoviesStates {}

class UpcomingMoviesLoadingState extends UpcomingMoviesStates {}

class UpcomingMoviesErrorState extends UpcomingMoviesStates {
  Failures failures;

  UpcomingMoviesErrorState({required this.failures});
}

class UpcomingMoviesSuccessState extends UpcomingMoviesStates {
  UpcomingMoviesEntity upcomingMoviesEntity;

  UpcomingMoviesSuccessState({required this.upcomingMoviesEntity});
}
