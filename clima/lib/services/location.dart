import 'package:geolocator/geolocator.dart';

class Locator {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest); // only for demo for now
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      //print(e);
    }
  }
}
