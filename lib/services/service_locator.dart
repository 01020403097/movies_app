import 'package:get_it/get_it.dart';
import 'package:movies_app/domain/use_cases/upcoming_movies_use_case.dart';
import 'package:movies_app/tabs/home_tab/upcoming/cubit/upcoming_movies_view_model.dart';

import '../api/api_manager.dart';
import '../data/data_sources/remote_data_source/popular_movies_data_source.dart';
import '../data/data_sources/remote_data_source/popular_movies_data_source_impl.dart';
import '../data/data_sources/remote_data_source/top_rated_movies_data_source.dart';
import '../data/data_sources/remote_data_source/top_rated_movies_data_source_impl.dart';
import '../data/data_sources/remote_data_source/upcoming_movies_data_source.dart';
import '../data/data_sources/remote_data_source/upcoming_movies_data_source_impl.dart';
import '../data/repository/popular_movies_repository_impl.dart';
import '../data/repository/top_rated_movies_repository_impl.dart';
import '../data/repository/upcoming_movies_repository_impl.dart';
import '../domain/repository/popular_movies_repository.dart';
import '../domain/repository/top_rated_movies_repository.dart';
import '../domain/repository/upcoming_movies_repository.dart';
import '../domain/use_cases/popular_movies_use_case.dart';
import '../domain/use_cases/top_rated_movies_use_case.dart';
import '../tabs/home_tab/popular/cubit/popular_movies_view_model.dart';
import '../tabs/home_tab/top_rated/cubit/top_rated_movies_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ApiManager>(() => ApiManager());

  getIt.registerLazySingleton<UpcomingMoviesDataSource>(
      () => UpcomingMoviesDataSourceImpl(apiManager: getIt()));

  getIt.registerLazySingleton<UpcomingMoviesRepository>(
      () => UpcomingMoviesRepositoryImpl(upcomingMoviesDataSource: getIt()));

  getIt.registerLazySingleton<UpcomingMoviesUseCase>(
      () => UpcomingMoviesUseCase(upcomingMoviesRepository: getIt()));

  getIt.registerFactory<UpcomingMoviesViewModel>(
      () => UpcomingMoviesViewModel(upcomingMoviesUseCase: getIt()));



  getIt.registerLazySingleton<TopRatedMoviesDataSource>(
          () => TopRatedMoviesDataSourceImpl(apiManager: getIt()));

  getIt.registerLazySingleton<TopRatedMoviesRepository>(
          () => TopRatedMoviesRepositoryImpl(topRatedMoviesDataSource: getIt()));

  getIt.registerLazySingleton<TopRatedMoviesUseCase>(
          () => TopRatedMoviesUseCase(topRatedMoviesRepository: getIt()));

  getIt.registerFactory<TopRatedMoviesViewModel>(
          () => TopRatedMoviesViewModel(topRatedMoviesUseCase: getIt()));


  getIt.registerLazySingleton<PopularMoviesDataSource>(
          () => PopularMoviesDataSourceImpl(apiManager: getIt()));

  getIt.registerLazySingleton<PopularMoviesRepository>(
          () => PopularMoviesRepositoryImpl(popularMoviesDataSource: getIt()));

  getIt.registerLazySingleton<PopularMoviesUseCase>(
          () => PopularMoviesUseCase(popularMoviesRepository: getIt()));

  getIt.registerFactory<PopularMoviesViewModel>(
          () => PopularMoviesViewModel(popularMoviesUseCase: getIt()));
}
