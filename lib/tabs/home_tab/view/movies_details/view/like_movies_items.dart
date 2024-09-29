import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/shared/style/app_theme.dart';
import 'package:movies_app/tabs/home_tab/top_rated/cubit/top_rated_movies_states.dart';
import 'package:movies_app/tabs/home_tab/top_rated/cubit/top_rated_movies_view_model.dart';

import '../../../widgets/movie_item.dart';

class LikeMoviesItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TopRatedMoviesViewModel viewModel =
        GetIt.I<TopRatedMoviesViewModel>();

    viewModel.getAllTopRatedMovies();

    return BlocBuilder<TopRatedMoviesViewModel, TopRatedMoviesStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Container(
          color: AppTheme.containerColor,
          padding:
              const EdgeInsetsDirectional.only(top: 17, start: 17, bottom: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('More Like This',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10),
              if (state is TopRatedMoviesSuccessState)
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 17,
                      childAspectRatio: 1.8,
                    ),
                    itemCount: viewModel.topRatedMoviesList.length,
                    itemBuilder: (context, index) {
                      final movie = viewModel.topRatedMoviesList[index];
                      final imageUrl =
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}';
                      final rating = movie.voteAverage.toString();
                      final title = movie.title;
                      final releaseDate = movie.releaseDate;
                      final genreIds = movie.genreIds;

                      final firstGenreId =
                          genreIds!.isNotEmpty ? genreIds.first.toString() : '';

                      return MovieItem(
                        image: imageUrl,
                        rating: rating,
                        title: title,
                        releaseDate: DateFormat('yyyy')
                            .format(DateTime.parse(releaseDate!)),
                        genreIds: firstGenreId,
                        showDetails: true,
                      );
                    },
                  ),
                )
              else if (state is TopRatedMoviesErrorState)
                Center(
                  child: Text(
                    'Error: ${state.failures}',
                    style: TextStyle(color: AppTheme.orange),
                  ),
                )
              else
                Center(
                    child: CircularProgressIndicator(color: AppTheme.orange)),
            ],
          ),
        );
      },
    );
  }
}
