import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/use_cases/upcoming_movies_use_case.dart';
import '../../../../domain/entities/upcoming_movies_entity.dart';
import '../../../../domain/failures.dart';
import 'upcoming_movies_states.dart';
import 'package:dartz/dartz.dart';

@injectable
class UpcomingMoviesViewModel extends Cubit<UpcomingMoviesStates> {
  UpcomingMoviesUseCase upcomingMoviesUseCase;

  List<ResultsEntity> upcomingMoviesList = [];

  UpcomingMoviesViewModel({required this.upcomingMoviesUseCase})
      : super(UpcomingMoviesLoadingState());

  Future<Either<Failures, UpcomingMoviesEntity>> getAllUpcomingMovies() async {
    var either = await upcomingMoviesUseCase.invoke();

    either.fold(
          (error) {
        emit(UpcomingMoviesErrorState(failures: error));
      },
          (response) {
        if (response.results != null) {
          upcomingMoviesList = response.results!;
        }
        emit(UpcomingMoviesSuccessState(upcomingMoviesEntity: response));
      },
    );

    return either;
  }
}


