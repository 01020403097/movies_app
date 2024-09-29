import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_constants.dart';
import 'package:movies_app/tabs/home_tab/view/movies_details/data/data_source/like_movie_data_source.dart';
import 'package:movies_app/tabs/home_tab/view/movies_details/data/model/similar_movies_dto.dart';

class LikeMovieApiDataSource extends LikeMovieDataSource {
  @override
  Future<List<SimilarMovie>> getLikeMovies(String movieId) async {
    final uri =
        Uri.https(ApiConstants.baseUrl, ApiConstants.similarMoviesEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'category': movieId,
    });

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final likeMovieResponse = SimilarMoviesDto.fromJson(json);

    if (likeMovieResponse.results == 'ok' &&
        likeMovieResponse.totalPages != null) {
      return likeMovieResponse.results!;
    } else {
      throw Exception('Failed to get sources');
    }
  }
}
