import 'package:movies_app/domain/entities/top_rated_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';

abstract class TopRatedMoviesStates {}

class TopRatedMoviesLoadingState extends TopRatedMoviesStates {}

class TopRatedMoviesErrorState extends TopRatedMoviesStates {
  Failures failures;

  TopRatedMoviesErrorState({required this.failures});
}

class TopRatedMoviesSuccessState extends TopRatedMoviesStates {
  TopRatedMoviesEntity topRatedMoviesEntity;

  TopRatedMoviesSuccessState({required this.topRatedMoviesEntity});
}
