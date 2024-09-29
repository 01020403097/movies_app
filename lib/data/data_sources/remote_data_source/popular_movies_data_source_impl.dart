import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/data/data_sources/remote_data_source/popular_movies_data_source.dart';
import 'package:movies_app/data/model/popular_movies_dto.dart';

import 'package:movies_app/domain/failures.dart';
import 'package:http/http.dart' as http;

@injectable
class PopularMoviesDataSourceImpl implements PopularMoviesDataSource {
  ApiManager apiManager;

  PopularMoviesDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, PopularMoviesDto>> popularMovies() async {
    try {
      final result = await ApiManager.getPopularMovies();
      return Right(result);
    } on http.ClientException catch (e) {
      return Left(NetworkError(errorMessage: "Network error: ${e.message}"));
    } catch (e) {
      return Left(ServerError(errorMessage: "Server error: ${e.toString()}"));
    }
  }
}
