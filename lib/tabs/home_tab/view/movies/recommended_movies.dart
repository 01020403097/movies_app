import 'package:flutter/material.dart';
import 'package:movies_app/shared/style/app_theme.dart';
import 'package:movies_app/tabs/home_tab/view/movies/movie_item.dart';
import 'package:movies_app/tabs/home_tab/view/movies/movie_modal.dart';

class RecommendedMovies extends StatelessWidget {
  final List<MovieModal> movieList = [
    MovieModal(
      image: 'assets/images/movie.png',
      title: 'Deadpool 2',
      rating: '7.7',
      duration: '2018  R  1h 59m',
    ),
    MovieModal(
      image: 'assets/images/movie.png',
      title: 'Deadpool 2',
      rating: '7.7',
      duration: '2018  R  1h 59m',
    ),
    MovieModal(
      image: 'assets/images/movie.png',
      title: 'Deadpool 2',
      rating: '7.7',
      duration: '2018  R  1h 59m',
    ),
    MovieModal(
      image: 'assets/images/movie.png',
      title: 'Deadpool 2',
      rating: '7.7',
      duration: '2018  R  1h 59m',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.containerColor,
      padding: const EdgeInsetsDirectional.only(top: 17, start: 17, bottom: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recommended', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 17,
                childAspectRatio:  1.8,
              ),
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return MovieItem(
                  movie: movieList[index],
                  showDetails: true, // Only show image
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
