import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionControoller {
  final Permission _locationPermission;
  RequestPermissionControoller(this._locationPermission);

  final _streamController = StreamController<PermissionStatus>.broadcast();

  Stream<PermissionStatus> get onStatusChanged => _streamController.stream;

  Future<PermissionStatus> check() async {
    final status = await _locationPermission.status;
    return status;
  }

  Future<void> request() async {
    final status = await _locationPermission.request();
    print("status $status");
    _notifi(status);
  }

  void _notifi(PermissionStatus status) {
    if (!_streamController.isClosed && _streamController.hasListener) {
      _streamController.sink.add(status);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
