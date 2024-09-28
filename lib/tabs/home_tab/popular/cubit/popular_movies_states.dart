import 'package:movies_app/domain/entities/popular_movies_entity.dart';
import 'package:movies_app/domain/failures.dart';

abstract class PopularMoviesStates {}

class PopularMoviesLoadingState extends PopularMoviesStates {}

class PopularMoviesErrorState extends PopularMoviesStates {
  Failures failures;

  PopularMoviesErrorState({required this.failures});
}

class PopularMoviesSuccessStates extends PopularMoviesStates {
  PopularMoviesEntity popularMoviesEntity;

  PopularMoviesSuccessStates({required this.popularMoviesEntity});
}
