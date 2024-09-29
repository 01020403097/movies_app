class MovieModal {
  final String image;
  final String title;
  final String year;
  final String rating;
  final String duration;

  MovieModal({
    required this.image,
    required this.title,
    required this.year,
    required this.rating,
    required this.duration,
  });

  // Factory method to create a MovieModal from a Map
  factory MovieModal.fromMap(Map<String, String> map) {
    return MovieModal(
      image: map['image']!,
      title: map['title']!,
      year: map['year']!,
      rating: map['rating']!,
      duration: map['duration']!,
    );
  }

  // Convert MovieModal to a Map (if needed)
  Map<String, String> toMap() {
    return {
      'image': image,
      'title': title,
      'year': year,
      'rating': rating,
      'duration': duration,
    };
  }
}
