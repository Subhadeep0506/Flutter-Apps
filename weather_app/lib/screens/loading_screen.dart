import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // get the location as soon as the screen loads
    getLocation();
  }

  void getLocation() async {
    await Location().getCurrentLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset('assets/images/splash_background_alt.jpg').image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
