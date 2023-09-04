import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternetConnection {
  Future<bool> checkInternetConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
