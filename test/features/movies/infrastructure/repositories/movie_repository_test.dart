import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_movie_it/core/failures/failures.dart';
import 'package:just_movie_it/core/network/network_info.dart';
import 'package:just_movie_it/core/services/http/http.dart';
import 'package:just_movie_it/core/services/http/http_error.dart';
import 'package:just_movie_it/features/movies/domain/entities/movie_entity.dart';
import 'package:just_movie_it/features/movies/domain/repositories/movie_repository.dart';
import 'package:just_movie_it/features/movies/infrastructure/repositories/movie_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

class ClientSpy extends Mock implements IHttpClient {}

class NetworkSpy extends Mock implements INetworkInfo {}

class UriFake extends Fake implements Uri {}

void main() {
  late INetworkInfo networkInfo;
  late IHttpClient httpClient;
  late IMovieRepository repository;

  setUp(() {
    httpClient = ClientSpy();
    networkInfo = NetworkSpy();
    repository = MovieRepository(
      networkInfo: networkInfo,
      httpClient: httpClient,
    );
  });

  setUpAll(() => registerFallbackValue(UriFake()));

  test('should return a list of movies when the call to the API is successful',
      () async {
    when(() => httpClient.get(any())).thenAnswer(
        (_) async => HttpResponse(data: kMoviesResponse, statusCode: 200));
    when(() => networkInfo.isConnected).thenAnswer((_) async => true);
    final result = await repository.getPopularMovies();
    expect(result, isA<Right>());
    expect(result.getOrElse(() => []), isA<List<MovieEntity>>());
  });

  test('should return a NetworkFailure when when there is a error', () async {
    when(() => httpClient.get(any())).thenThrow(HttpError.badRequest);
    when(() => networkInfo.isConnected).thenAnswer((_) async => true);
    final result = await repository.getPopularMovies();
    expect(result.isLeft(), true);
    expect(result.fold((l) => l, (r) => []), isA<NetworkFailure>());
  });
}
