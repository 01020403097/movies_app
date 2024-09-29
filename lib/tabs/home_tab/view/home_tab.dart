import 'package:flutter/material.dart';
import 'package:movies_app/tabs/home_tab/view/movies/new_movies.dart';
import 'package:movies_app/tabs/home_tab/view/movies/recommended_movies.dart';
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
              MovieCarousel(),
              const SizedBox(height: 20,),
              SizedBox(height: 187, child: NewMovies()),
              const SizedBox(height: 20,),
              SizedBox(height: 246, child: RecommendedMovies()),
              // const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
