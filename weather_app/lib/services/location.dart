import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation(BuildContext ctx) async {
    bool isLocationEnabled;
    LocationPermission permission;

    Position position;

    isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(
            content: Text('Location Service Unavailable!'),
          ),
        );
      }
    } else {
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      print(position);

      latitude = position.latitude;
      longitude = position.longitude;
    }
  }
}
