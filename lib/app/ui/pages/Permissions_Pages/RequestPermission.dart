// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:utp/app/ui/pages/Routes/Routes.dart';
import 'package:utp/app/ui/pages/Permissions_Pages/RequestController.dart';

class RequestPermission extends StatefulWidget {
  const RequestPermission({super.key});

  @override
  State<RequestPermission> createState() => _RequestPermissionState();
}

class _RequestPermissionState extends State<RequestPermission>
    with WidgetsBindingObserver {
  // ignore: non_constant_identifier_names
  final _Controller =
      RequestPermissionControoller(Permission.locationWhenInUse);

  bool _fromSettings = false;

  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscription = _Controller.onStatusChanged.listen(
      (status) {
        switch (status) {
          case PermissionStatus.granted:
            _goHome();
            break;
          case PermissionStatus.permanentlyDenied:
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Eror"),
                content: const Text(
                    "Se nesesita la ubicación para poder brindarle toda las funcionalidades att: UTP"),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      _fromSettings = await openAppSettings();
                    },
                    child: const Text("Ir A Ajustes"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  )
                ],
              ),
            );
            break;
          case PermissionStatus.denied:
            // TODO: Handle this case.
            break;
          case PermissionStatus.restricted:
            // TODO: Handle this case.
            break;
          case PermissionStatus.limited:
            // TODO: Handle this case.
            break;
        }
      },
    );
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && _fromSettings) {
      final status = await _Controller.check();

      if (status == PermissionStatus.granted) {
        _goHome();
      }
    }
    _fromSettings = false;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription.cancel();
    _Controller.dispose();
    super.dispose();
  }

  void _goHome() {
    Navigator.pushReplacementNamed(context, Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: ElevatedButton(
          child: const Text("allow"),
          onPressed: () {
            _Controller.request();
          },
        ),
      )),
    );
  }
}
