import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/data/data_sources/remote_data_source/top_rated_movies_data_source.dart';
import 'package:movies_app/data/model/top_rated_movies_dto.dart';
import 'package:movies_app/domain/failures.dart';
import 'package:http/http.dart' as http;

@injectable
class TopRatedMoviesDataSourceImpl implements TopRatedMoviesDataSource {
  ApiManager apiManager;

  TopRatedMoviesDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, TopRatedMoviesDto>> topRatedMovies() async {
    try {
      final result = await ApiManager.getTopRatedMovies();
      return Right(result);
    } on http.ClientException catch (e) {
      return Left(NetworkError(errorMessage: "Network error: ${e.message}"));
    } catch (e) {
      return Left(ServerError(errorMessage: "Server error: ${e.toString()}"));
    }
  }
}
