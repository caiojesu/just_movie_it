import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_movie_it/core/network/network_info.dart';
import 'package:just_movie_it/core/network/network_info_service.dart';
import 'package:mocktail/mocktail.dart';

class ConnectivitySpy extends Mock implements Connectivity {}

void main() {
  late INetworkInfo networkInfo;
  late ConnectivitySpy connectivitySpy;

  setUp(() {
    connectivitySpy = ConnectivitySpy();
    networkInfo = NetworkInfoService(connectivitySpy);
  });

  group('isConnected', () {
    test('should return true when there is a network connection', () async {
      when(connectivitySpy.checkConnectivity)
          .thenAnswer((_) async => ConnectivityResult.wifi);
      expect(await networkInfo.isConnected, true);
    });

    test('should return false when there is no network connection', () async {
      when(connectivitySpy.checkConnectivity)
          .thenAnswer((_) async => ConnectivityResult.none);
      expect(await networkInfo.isConnected, false);
    });
  });
}
