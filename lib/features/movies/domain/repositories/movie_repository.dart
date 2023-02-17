import 'package:dartz/dartz.dart';
import 'package:just_movie_it/core/failures/failures.dart';
import '../entities/movie_entity.dart';

abstract class IMovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
}
