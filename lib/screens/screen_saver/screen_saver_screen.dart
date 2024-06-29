import 'package:flutter/material.dart';
import 'package:ra_media_test/screens/screen_saver/components/screen_saver_body.dart';

class ScreenSaverScreen extends StatelessWidget {
  static String routeName = '/screen-saver';

  const ScreenSaverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: ScreenSaverBody());
  }
}
