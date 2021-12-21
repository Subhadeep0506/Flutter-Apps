import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:weather_app/screens/loading_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      imageBackground: Image.asset('assets/images/animated_splash.gif').image,
      seconds: 6,
      useLoader: false,
      // loaderColor: Colors.white,
      navigateAfterSeconds: LoadingScreen(),
      title: const Text(
        'Weather App\n\n\n',
        style: TextStyle(
          fontSize: 50,
          fontFamily: 'SpartanMB',
        ),
      ),
    );
  }
}
