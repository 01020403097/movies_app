import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/style/app_theme.dart';
import '../view_model/bloc_cubit/like_movies_cubit.dart';
import '../view_model/bloc_cubit/like_movies_state.dart';
import 'like_movies_items.dart';

class MoreLikeThis extends StatelessWidget {
  final int movieId; // Movie ID to fetch similar movies

  MoreLikeThis({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeMoviesCubit, LikeMoviesState>(
      builder: (context, state) {
        if (state is LikeMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetLikeMoviesError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is GetLikeMoviesSuccess) {
          final similarMovies =
              state.similarMovie; // Get the similar movies list

          return Container(
            color: AppTheme.containerColor,
            padding: const EdgeInsetsDirectional.only(
                top: 17, start: 17, bottom: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('More Like This',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2, // Adjust aspect ratio as needed
                    ),
                    itemCount: similarMovies.length,
                    itemBuilder: (context, index) {
                      return LikeMoviesItems();
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Container(); // Return empty container if no state matches
      },
    );
  }
}
