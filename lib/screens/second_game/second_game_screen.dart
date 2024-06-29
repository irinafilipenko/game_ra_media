import 'package:flutter/material.dart';
import 'package:ra_media_test/screens/second_game/components/second_game_body.dart';

class SecondGameScreen extends StatelessWidget {
  static String routeName = '/second-game';

  const SecondGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: SecondGameBody());
  }
}
