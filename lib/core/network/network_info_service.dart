import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:just_movie_it/core/network/network_info.dart';

@Injectable(as: INetworkInfo)
class NetworkInfoService implements INetworkInfo {
  final Connectivity connectivity;

  NetworkInfoService(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
