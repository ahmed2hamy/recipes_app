import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    List<ConnectivityResult> results = await connectivity.checkConnectivity();
    return _isConnectedFromConnectivityResults(results);
  }

  bool _isConnectedFromConnectivityResults(List<ConnectivityResult> results) {
    return results.any((result) => result != ConnectivityResult.none);
  }
}
