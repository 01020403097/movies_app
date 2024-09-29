import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/popular_movies_entity.dart';
import 'package:movies_app/domain/use_cases/popular_movies_use_case.dart';
import 'package:movies_app/tabs/home_tab/popular/cubit/popular_movies_states.dart';
import '../../../../domain/failures.dart';
import 'package:dartz/dartz.dart';

@injectable
class PopularMoviesViewModel extends Cubit<PopularMoviesStates> {
  PopularMoviesUseCase popularMoviesUseCase;

  List<ResultsEntity> popularMoviesList = [];

  PopularMoviesViewModel({required this.popularMoviesUseCase})
      : super(PopularMoviesLoadingState());

  Future<Either<Failures, PopularMoviesEntity>> getAllPopularMovies() async {
    var either = await popularMoviesUseCase.invoke();

    either.fold(
          (error) {
        emit(PopularMoviesErrorState(failures: error));
      },
          (response) {
            if (response.results != null) {
              popularMoviesList = response.results!;
            }
        emit(PopularMoviesSuccessStates(popularMoviesEntity: response));
      },
    );

    return either;
  }
}

