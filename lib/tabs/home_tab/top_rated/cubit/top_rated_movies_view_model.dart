import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/use_cases/top_rated_movies_use_case.dart';
import 'package:movies_app/tabs/home_tab/top_rated/cubit/top_rated_movies_states.dart';
import '../../../../domain/entities/top_rated_movies_entity.dart';
import '../../../../domain/failures.dart';

import 'package:dartz/dartz.dart';

@injectable
class TopRatedMoviesViewModel extends Cubit<TopRatedMoviesStates> {
  TopRatedMoviesUseCase topRatedMoviesUseCase;

  List<ResultsEntity> topRatedMoviesList = [];

  TopRatedMoviesViewModel({required this.topRatedMoviesUseCase})
      : super(TopRatedMoviesLoadingState());

  Future<Either<Failures, TopRatedMoviesEntity>> getAllTopRatedMovies() async {
    var either = await topRatedMoviesUseCase.invoke();

    either.fold(
      (error) {
        emit(TopRatedMoviesErrorState(failures: error));
      },
      (response) {
        if (response.results != null) {
          topRatedMoviesList = response.results!;
        }
        emit(TopRatedMoviesSuccessState(topRatedMoviesEntity: response));
      },
    );

    return either;
  }
}
