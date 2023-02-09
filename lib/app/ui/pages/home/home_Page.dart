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
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _controller.onMapCreated,
            initialCameraPosition: _initalCameraPosition,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            minMaxZoomPreference: const MinMaxZoomPreference(15.0, 36.0),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 246, 255),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
