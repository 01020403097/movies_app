import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared/style/app_theme.dart';

class MovieCarousel extends StatefulWidget {
  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  final List<Map<String, String>> movieList = [
    {
      'image': 'assets/images/dora.png',
      'title': 'Dora and the Lost City of Gold',
      'year': '2019',
      'rating': 'PG-13',
      'duration': '2h 7m',
    },
  ];

  bool isBookmarked = true;

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.35,
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: movieList.map((movie) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(movie['image']!),
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
                    onPressed: () {},
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
                              child: Image.asset(
                                'assets/images/dora-2.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
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
                            onPressed: () {
                              _toggleBookmark();
                            },
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
                        ],
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(movie['title']!,
                                style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${movie['year']} • ${movie['rating']} • ${movie['duration']}',
                              style: Theme.of(context).textTheme.bodySmall,
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
        );
      }).toList(),
    );
  }
}
