import 'package:movies_app/tabs/home_tab/view/movies_details/data/data_source/like_movie_data_source.dart';
import 'package:movies_app/tabs/home_tab/view/movies_details/data/model/similar_movies_dto.dart';

class LikeMovieRepository {
  final LikeMovieDataSource likeMovieDataSource;

  LikeMovieRepository(this.likeMovieDataSource);

  Future<List<SimilarMovie>> getLikeMovies(String movieId) async {
    return likeMovieDataSource.getLikeMovies(movieId);
  }
}
