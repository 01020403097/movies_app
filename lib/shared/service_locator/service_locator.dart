import 'package:movies_app/tabs/home_tab/view/movies_details/data/data_source/like_movie_api_data_source.dart';
import 'package:movies_app/tabs/home_tab/view/movies_details/data/data_source/like_movie_data_source.dart';

class ServiceLocator {
  static LikeMovieDataSource likeMovieDataSource = LikeMovieApiDataSource();
}
