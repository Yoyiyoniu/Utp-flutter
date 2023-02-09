import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:utp/app/ui/pages/home/utils/mapStyle.dart';

class HomeController {
  void onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(mapStyle);
  }
}
