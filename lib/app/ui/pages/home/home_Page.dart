import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:utp/app/ui/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  final _initalCameraPosition = const CameraPosition(
    target: LatLng(32.6218121, -115.5224192),
    zoom: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _initalCameraPosition,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        minMaxZoomPreference: const MinMaxZoomPreference(15.0, 36.0),
      ),
    );
  }
}
