String apiKey = const String.fromEnvironment('TMDB_API_KEY');
String baseUrl = "https://api.themoviedb.org/3";

class Endpoints {
  static String movies = '$baseUrl/movie/popular?api_key=$apiKey';
}