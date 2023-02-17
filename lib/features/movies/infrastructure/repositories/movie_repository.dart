import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:just_movie_it/core/constants/endpoints.dart';
import 'package:just_movie_it/core/failures/network_failure.dart';
import 'package:just_movie_it/core/network/network_info.dart';
import 'package:just_movie_it/core/services/http/http.dart';
import 'package:just_movie_it/core/services/http/http_error.dart';
import 'package:just_movie_it/features/movies/domain/entities/movie_entity.dart';
import 'package:just_movie_it/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:just_movie_it/features/movies/domain/repositories/movie_repository.dart';

import '../models/movie_model.dart';

@Injectable(as: IMovieRepository)
class MovieRepository implements IMovieRepository {
  final INetworkInfo networkInfo;
  final IHttpClient httpClient;

  MovieRepository({
    @injectable required this.networkInfo,
    @injectable required this.httpClient,
  });

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final HttpResponse response = await httpClient.get(Endpoints.movies);
        final movieList = <MovieEntity>[];
        final json = jsonDecode(response.data);
        final movies = json['results'] as List;
        for (var element in movies) {
          final movie = MovieModel.fromJson(element);
          movieList.add(movie.toEntity());
        }
        return Right(movieList);
        //TODO: Tratar erros
      } on HttpError catch (error) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
