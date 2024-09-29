import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/tabs/home_tab/view/movies_details/model/movie_details_model.dart';

class ApiMoviesDetails {
  Future<SimilarMoviesResponse> fetchSimilarMovies(
      int movieId, String apiKey) async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return SimilarMoviesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load similar movies');
    }
  }
}
