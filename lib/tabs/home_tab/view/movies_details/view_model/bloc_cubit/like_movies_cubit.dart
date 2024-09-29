import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/service_locator/service_locator.dart';
import 'package:movies_app/tabs/home_tab/view/movies_details/data/repository/like_movie_repository.dart';
import 'package:movies_app/tabs/home_tab/view/movies_details/view_model/bloc_cubit/like_movies_state.dart';

class LikeMoviesCubit extends Cubit<LikeMoviesState> {
  late final LikeMovieRepository likeMovieRepository;

  LikeMoviesCubit() : super(LikeMoviesInitial()) {
    likeMovieRepository =
        LikeMovieRepository(ServiceLocator.likeMovieDataSource);
  }

  Future<void> getLikeMovies(String movieId) async {
    emit(LikeMoviesLoading());
    try {
      final likeMoviesSource = await likeMovieRepository.getLikeMovies(movieId);
      emit(GetLikeMoviesSuccess(likeMoviesSource));
    } catch (error) {
      emit(GetLikeMoviesError(error.toString()));
    }
  }
}
