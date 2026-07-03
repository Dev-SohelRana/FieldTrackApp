import 'package:field_track_app/assets_helper/app_image.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.splashImage,
          fit: BoxFit.cover,
          alignment: Alignment.center,
          width: double.infinity,
        ),
      ),
    );
  }
}
