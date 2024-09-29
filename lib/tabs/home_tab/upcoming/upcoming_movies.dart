import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/style/app_theme.dart';
import 'package:movies_app/tabs/home_tab/upcoming/cubit/upcoming_movies_states.dart';
import 'package:movies_app/tabs/home_tab/upcoming/cubit/upcoming_movies_view_model.dart';
import 'package:get_it/get_it.dart';
import '../widgets/movie_item.dart';

class UpcomingMovies extends StatelessWidget {
  UpcomingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final UpcomingMoviesViewModel viewModel =
    GetIt.I<UpcomingMoviesViewModel>();

    // Call the method to fetch movies on build
    viewModel.getAllUpcomingMovies(); // <-- Call the method here

    return BlocBuilder<UpcomingMoviesViewModel, UpcomingMoviesStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Container(
          color: AppTheme.containerColor,
          padding:
          const EdgeInsetsDirectional.only(top: 17, start: 17, bottom: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('New Release', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10),
              if (state is UpcomingMoviesSuccessState) // Handle success state
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 17,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: viewModel.upcomingMoviesList.length,
                    itemBuilder: (context, index) {
                      final movie = viewModel.upcomingMoviesList[index];
                      final imageUrl =
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}';
                      return MovieItem(
                        image: imageUrl,
                        showDetails: false,
                      );
                    },
                  ),
                )
              else if (state is UpcomingMoviesErrorState)
                Center(
                  child: Text(
                    'Error: ${state.failures}',
                    style: TextStyle(color: AppTheme.orange),
                  ),
                )
              else
                Center(child: CircularProgressIndicator(color: AppTheme.orange)),
            ],
          ),
        );
      },
    );
  }
}
