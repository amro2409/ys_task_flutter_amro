import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stock_market_tracker/src/core/constants/enums.dart';



//import 'package:injectable/injectable.dart';

//@lazySingleton
class ConnectivityService {
  // Create our public controller
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    // Subscribe to the connectivity Changed Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  // Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default:
        return ConnectivityStatus.offline;
    }
  }

}


//
// class ConnectivityProvider extends ChangeNotifier {
//   ConnectivityResult _connectionStatus = ConnectivityResult.none;
//   final _connectivity = Connectivity();
//   late Stream<ConnectivityResult> _connectivityStream;
//
//   ConnectivityProvider() {
//     _checkConnection();
//   }
//
//   void _checkConnection() {
//     _connectivityStream = _connectivity.onConnectivityChanged;
//
//     _connectivity.checkConnectivity().then((result) {
//       _connectionStatus = result;
//       notifyListeners();
//     });
//
//     _connectivityStream.listen((result) {
//       _connectionStatus = result;
//    R   notifyListeners();
//       // Notify user about connectivity change
//
//     });
//   }
//
//   ConnectivityResult get connectionStatus => _connectionStatus;
//
//   Stream<ConnectivityResult> get connectivityStream => _connectivityStream;
//
//
//
//   void dispose() {
//     super.dispose();
//   }
// }
