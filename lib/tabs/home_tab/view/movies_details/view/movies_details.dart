import 'package:flutter/material.dart';
import 'package:movies_app/shared/style/app_theme.dart';
import 'package:movies_app/tabs/home_tab/view/movies/movie_modal.dart';
import 'package:movies_app/tabs/home_tab/view/movies_details/view/like_movies_items.dart';

class MoviesDetails extends StatefulWidget {
  final MovieModal movieModal;

  MoviesDetails({required this.movieModal});

  @override
  _MoviesDetailsState createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  bool isBookmarked = true;

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppTheme.primary,
          ),
        ),
        title: Text(
          widget.movieModal.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppTheme.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.movieModal.image),
                  // Load from network
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: IconButton(
                  iconSize: 60.0,
                  icon: const Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Add functionality for playing the movie
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movieModal.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppTheme.primary, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.movieModal.year} • ${widget.movieModal.rating} • ${widget.movieModal.duration}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppTheme.lightGray),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            // Load poster from network
                            widget.movieModal.image,
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.27,
                            fit: BoxFit.cover,
                          ),
                        ),
                        PositionedDirectional(
                          child: TextButton(
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
                                      ? const Color(0XFF514F4F)
                                          .withOpacity(0.87)
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildActionButton(context, 'Action 1'),
                            const SizedBox(width: 15),
                            _buildActionButton(context, 'Action 2'),
                            const SizedBox(width: 15),
                            _buildActionButton(context, 'Action 3'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // More Actions
                        Row(
                          children: [
                            _buildActionButton(context, 'Action 4'),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.016),
                        Text(
                          'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 13, color: AppTheme.lightGray),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {}, // Add functionality for rating
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                // Add functionality for star rating
                                icon: Icon(
                                  Icons.star,
                                  color: AppTheme.orange,
                                ),
                              ),
                              Text(
                                '7.7',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: AppTheme.primary, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: LikeMoviesItems(), // Ensure MoreLikeThis is implemented
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.gray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: GestureDetector(
        onTap: () {
          // Define action for the button
        },
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 10, color: AppTheme.lightGray),
        ),
      ),
    );
  }
}
