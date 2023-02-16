import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import 'package:just_movie_it/core/services/http/http.dart';

class HttpSpy extends Mock implements Client {}

class UriFake extends Fake implements Uri {}

void main() {
  late Client client;
  late IHttpClient httpService;
  late String url;
  late Response response;

  setUpAll(() => registerFallbackValue(UriFake()));

  setUp(() {
    client = HttpSpy();
    httpService = HttpService(client);
    url = faker.internet.httpUrl();
    response = Response('body', 200);
  });

  tearDown(() => client.close());

  group('HttpService get', () {
    test('should return an HttpResponse when calls to the client succeed',
        () async {
      when(() => client.get(any())).thenAnswer((_) async => response);
      final result = await httpService.get(url);
      expect(result, isA<HttpResponse>());
      expect(result.data, isNotNull);
      expect(result.statusCode, equals(200));
    });
  });

  group('HttpService post', () {
    test('should return an HttpResponse when calls to the client succeed',
        () async {
      when(() => client.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => response);
      final result = await httpService.post(url, body: {});
      expect(result, isA<HttpResponse>());
      expect(result.data, isNotNull);
      expect(result.statusCode, equals(200));
    });
  });
}
