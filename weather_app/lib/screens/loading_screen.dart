import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = 'a2d3a2289e7056bcf6cbfa1e46d9e845';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // variables to store geolocation data
  double latitude = 0;
  double longitude = 0;

  String city = '';
  double temperature = 0;

  @override
  void initState() {
    super.initState();
    // get the location as soon as the screen loads
    getLocationData();
  }

  // this function gets the current location
  // gets the weather data by sending a get request to API
  // then stores them in respective variables
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation(context);

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey',
    );

    var weatherData = await networkHelper.getData();

    temperature = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    city = weatherData['name'];

    print('City: $city');
    print('Temperature: ${temperature}K');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/images/splash_background_alt.jpg').image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.9,
            left: MediaQuery.of(context).size.width * 0.397,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: getLocationData,
              child: const Text('GET DATA'),
            ),
          )
        ],
      ),
    );
  }
}
