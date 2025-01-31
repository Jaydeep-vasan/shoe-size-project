import 'dart:developer' as logger;
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionHelper {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;

  // Current network status.
  String _connectStatus = 'Unknown';

  String get connectStatus => _connectStatus;

  // Constant for check network status
  static const String _connectivityMobile = 'ConnectivityResult.mobile';
  static const String _connectivityWifi = 'ConnectivityResult.wifi';

  factory ConnectionHelper() {
    return _singleton;
  }

  static final ConnectionHelper _singleton = ConnectionHelper._internal();

  ConnectionHelper._internal() {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectStatus = result.toString();
      logger.log('ConnectionStatus :: = $_connectStatus');
    });
  }

  // Initial set up.
  Future<void> setUpConnectivity() async {
    String connectionStatus;

    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
      logger.log('ConnectionStatus :: => $connectionStatus');
    } on Exception catch (e) {
      logger.log(e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }

    _connectStatus = connectionStatus;
    logger.log('ConnectionStatus :: => $_connectStatus');
  }

  // Check for network available.
  bool isInterNetAvailable() {
    debugPrint('ConnectionStatus :: => $_connectStatus');
    return (_connectStatus == ConnectionHelper._connectivityMobile) ||
        (_connectStatus == ConnectionHelper._connectivityWifi);
  }
}
