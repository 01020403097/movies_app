import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/model/popular_movies_dto.dart';
import 'package:movies_app/data/model/upcoming_movies_dto.dart';
import '../data/model/top_rated_movies_dto.dart';
import 'api_constants.dart';

class ApiManager {
  static Future<UpcomingMoviesDto> getUpcomingMovies() async {
    final String url = ApiConstants.upcomingMoviesEndpoint;
    final response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return UpcomingMoviesDto.fromJson(data);
      } else {
        throw Exception(
            'Failed to load upcoming movies: ${response.statusCode}');
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<TopRatedMoviesDto> getTopRatedMovies() async {
    final String url = ApiConstants.topRatedMoviesEndpoint;
    final response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return TopRatedMoviesDto.fromJson(data);
      } else {
        throw Exception(
            'Failed to load top rated movies: ${response.statusCode}');
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<PopularMoviesDto> getPopularMovies() async {
    final String url = ApiConstants.popularMoviesEndpoint;
    final response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return PopularMoviesDto.fromJson(data);
      } else {
        throw Exception(
            'Failed to load top rated movies: ${response.statusCode}');
      }
    } catch (error) {
      rethrow;
    }
  }
}
