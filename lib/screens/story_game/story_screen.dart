import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra_media_test/screens/story_game/components/story_body_part_2.dart';
import 'package:ra_media_test/screens/story_game/components/story_body_part_1.dart';
import 'package:ra_media_test/screens/story_game/story_controller.dart';

class StoryScreen extends GetView<StoryController> {
  static String routeName = '/story-game';

  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Obx(
        () {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: controller.getStorageService.currentStep.value <= 2
                ? StoryBodyPart1()
                : StoryBodyPart2(),
          );
        },
      ),
    );
  }
}
