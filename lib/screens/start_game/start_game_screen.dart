import 'package:flutter/material.dart';
import 'package:ra_media_test/screens/start_game/components/start_game_body.dart';

class StartGameScreen extends StatelessWidget {
  static String routeName = '/start-game';

  const StartGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: StartGameBody());
  }
}
