class ApiConstants {
  static const String apiKey = '9c67185af9ab4e226377e5bddb0e1587';
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String upcomingUrl = '/3/movie/upcoming';
  static const String topRatedUrl = '/3/movie/top_rated';
  static const String popularUrl = '/3/movie/popular';

  static String get upcomingMoviesEndpoint => '$baseUrl$upcomingUrl?api_key=$apiKey&language=en-US';
  static String get topRatedMoviesEndpoint => '$baseUrl$topRatedUrl?api_key=$apiKey&language=en-US';
  static String get popularMoviesEndpoint => '$baseUrl$popularUrl?api_key=$apiKey&language=en-US';
}
