import '../../data/model/similar_movies_dto.dart';

abstract class LikeMoviesState {}

class LikeMoviesInitial extends LikeMoviesState {}

class LikeMoviesLoading extends LikeMoviesState {}

class GetLikeMoviesSuccess extends LikeMoviesState {
  final List<SimilarMovie> similarMovie;

  GetLikeMoviesSuccess(this.similarMovie);
}

class GetLikeMoviesError extends LikeMoviesState {
  final String message;

  GetLikeMoviesError(this.message);
}
