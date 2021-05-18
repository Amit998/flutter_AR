import 'package:ar_face_filter_app/cameraWithMask.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreens extends StatefulWidget {
  @override
  _MySplashScreensState createState() => _MySplashScreensState();
}

class _MySplashScreensState extends State<MySplashScreens> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      title: Text(
        "AR Face Maks App",
        style: TextStyle(
          fontSize: 30,
          color: Colors.deepPurple,
          fontFamily: "Signatra",
        ),
      ),
      image: Image.asset("images/icon.png"),
      backgroundColor: Colors.white,
      photoSize: 140,
      loaderColor: Colors.deepPurple,
      loadingText: Text(
        "Ola",
        style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 28.0,
            fontFamily: "Brand bolt"),
      ),
      navigateAfterSeconds: CameraWithMask(),
    );
  }
}
