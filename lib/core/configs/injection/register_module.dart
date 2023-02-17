import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:just_movie_it/core/network/network_info_service.dart';
import 'package:just_movie_it/core/services/http/http_client.dart';
import 'package:just_movie_it/core/services/http/http_service.dart';

import '../../network/network_info.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Client get client => Client();
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  INetworkInfo get networkInfo => NetworkInfoService(Connectivity());
  @lazySingleton
  IHttpClient get httpClient => HttpService(client);
}
