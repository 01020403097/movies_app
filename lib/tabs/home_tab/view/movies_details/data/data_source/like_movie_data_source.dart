import '../model/similar_movies_dto.dart';

abstract class LikeMovieDataSource {
  Future<List<SimilarMovie>> getLikeMovies(String movieId);
}
