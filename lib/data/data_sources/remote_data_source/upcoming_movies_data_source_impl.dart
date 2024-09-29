import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/data/data_sources/remote_data_source/upcoming_movies_data_source.dart';
import 'package:movies_app/data/model/upcoming_movies_dto.dart';
import 'package:movies_app/domain/failures.dart';
import 'package:http/http.dart' as http;

@injectable
class UpcomingMoviesDataSourceImpl implements UpcomingMoviesDataSource {
  ApiManager apiManager;

  UpcomingMoviesDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, UpcomingMoviesDto>> upcomingMovies() async {
    try {
      final result = await ApiManager.getUpcomingMovies();
      return Right(result);
    } on http.ClientException catch (e) {
      return Left(NetworkError(errorMessage: "Network error: ${e.message}"));
    } catch (e) {
      return Left(ServerError(errorMessage: "Server error: ${e.toString()}"));
    }
  }
}
