import 'package:flutter/material.dart';
import 'package:movies_app/tabs/home_tab/top_rated/top_rated_movies.dart';
import '../popular/popular_movies.dart';
import '../upcoming/upcoming_movies.dart';
import 'movies/movie_carousel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopularMovies(),
              const SizedBox(height: 20,),
              SizedBox(height: 187, child: UpcomingMovies()),
              const SizedBox(height: 20,),
              SizedBox(height: 246, child: TopRatedMovies()),
              // const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
