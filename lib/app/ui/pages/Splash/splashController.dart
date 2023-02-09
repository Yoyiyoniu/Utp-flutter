import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:permission_handler/permission_handler.dart';
import 'package:utp/app/ui/pages/Routes/Routes.dart';

class SplashController extends ChangeNotifier {
  final Permission _Locationpermission;
  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._Locationpermission);

  Future<void> checkPermission() async {
    final isGranted = await _Locationpermission.isGranted;
    _routeName = isGranted ? Routes.HOME : Routes.PERMISSIONS;
    notifyListeners();
  }
}
