import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/shared/style/app_theme.dart';
import 'package:movies_app/tabs/home_tab/popular/cubit/popular_movies_states.dart';
import 'package:movies_app/tabs/home_tab/popular/cubit/popular_movies_view_model.dart';
import 'package:movies_app/tabs/home_tab/view/movies/movie_modal.dart'; // Import your MovieModal
import '../view/movies_details/movies_details.dart'; // Import your MoviesDetails

class PopularMovies extends StatefulWidget {
  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  bool isBookmarked = true;

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PopularMoviesViewModel viewModel = GetIt.I<PopularMoviesViewModel>();

    if (viewModel.popularMoviesList.isEmpty) {
      viewModel.getAllPopularMovies();
    }

    return BlocBuilder<PopularMoviesViewModel, PopularMoviesStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is PopularMoviesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PopularMoviesErrorState) {
          return Center(child: Text('Error: ${state.failures.toString()}'));
        } else if (state is PopularMoviesSuccessStates) {
          final movies = state.popularMoviesEntity.results;

          return CarouselSlider.builder(
            itemCount: movies?.length,
            itemBuilder: (context, index, realIdx) {
              final movie = movies?[index];

              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w500${movie?.backdropPath}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: IconButton(
                      iconSize: 60.0,
                      icon: const Icon(
                        Icons.play_circle_filled,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Navigate to the MoviesDetails page and pass the movie details
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MoviesDetails(
                              movieModal: MovieModal(
                                title: movie?.title ?? '',
                                year: movie?.releaseDate?.split('-')[0] ?? '',
                                rating: 'PG-${movie?.genreIds?.join(', ') ?? ''}', // Adjust according to your model
                                duration: '120 min', // Adjust according to your model
                                image: 'https://image.tmdb.org/t/p/w500${movie?.posterPath}', // Adjust according to your model
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    start: 10,
                    end: 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${movie?.posterPath}',
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width * 0.27,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(36, 36),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: _toggleBookmark,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.bookmark,
                                    color: isBookmarked
                                        ? const Color(0XFF514F4F).withOpacity(0.87)
                                        : AppTheme.orange,
                                    size: 36,
                                  ),
                                  Icon(
                                    isBookmarked ? Icons.add : Icons.check,
                                    color: AppTheme.whiteColor,
                                    size: 11,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                movie?.title ?? '',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    movie?.releaseDate ?? '',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(width: 5,),
                                  Text(
                                    'PG-${movie?.genreIds?.join(', ') ?? ''}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.35,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 1500),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
          );
        } else {
          return Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
