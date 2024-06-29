import 'package:flutter/material.dart';

import 'package:ra_media_test/screens/store/components/store_body.dart';

class StoreScreen extends StatelessWidget {
  static String routeName = '/store';

  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(children: [
          Image.asset(
            'assets/images/store_background.png',
            // fit: BoxFit.cover,
          ),
          const StoreBody()
        ]));
  }
}
