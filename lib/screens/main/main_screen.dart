import 'package:flutter/material.dart';
import 'package:ra_media_test/screens/main/components/main_body.dart';

class MainScreen extends StatelessWidget {
  static String routeName = '/main';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(children: [
          Image.asset(
            'assets/images/main_background.png',
            // fit: BoxFit.cover,
          ),
          const MainBody()
        ]));
  }
}
