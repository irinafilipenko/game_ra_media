import 'package:flutter/material.dart';

import 'package:ra_media_test/screens/splash/components/splash_body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(children: [
          Image.asset(
            'assets/images/splash.png',
            // fit: BoxFit.cover,
          ),
          const SplashBody()
        ]));
  }
}
