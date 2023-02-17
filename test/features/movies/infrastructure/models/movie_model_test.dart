import 'package:just_movie_it/features/movies/infrastructure/models/movie_model.dart';
import 'package:test/test.dart';

void main() {
  late MovieModel movie;
  late Map<String, Object> json;

  setUp(() {
    movie = const MovieModel(
      id: 123,
      backdropPath: 'back',
      posterPath: 'poster',
      title: 'title',
    );
    json = {
      'id': 123,
      'backdrop_path': 'back',
      'poster_path': 'poster',
      'title': 'title',
    };
  });
  group('MovieModel', () {
    test('fromJson/toJson', () {
      expect(movie, MovieModel.fromJson(json));
      expect(json, movie.toJson());
    });
  });
}
