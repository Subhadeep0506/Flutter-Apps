import 'package:flutter/material.dart';
import 'package:flutter_realtime_detection/home.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:camera/camera.dart';

class SplashPage extends StatelessWidget {
  List<CameraDescription> cameras = [];
  SplashPage(this.cameras);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text(
        'Pose Estimator',
        style: TextStyle(
          fontFamily: 'SpartanMB',
          fontSize: 40,
          color: Colors.white,
        ),
      ),
      navigateAfterSeconds: HomePage(cameras),
      image: Image.asset('assets/icon.png'),
      photoSize: 70,
      seconds: 4,
      gradientBackground: LinearGradient(
        colors: [
          Colors.blueAccent,
          Colors.greenAccent,
          Colors.green,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      loaderColor: Colors.white,
    );
  }
}
