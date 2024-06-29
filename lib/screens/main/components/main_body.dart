import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra_media_test/components/custom_app_bar.dart';

import 'package:ra_media_test/screens/main/main_controller.dart';

class MainBody extends GetView<MainController> {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Obx(() {
              return CustomAppBar(
                point: controller.getStorageService.point.value.toString(),
                image: controller.isPlaying.value
                    ? 'assets/images/music_button_turn_off.png'
                    : 'assets/images/music_button.png',
                onTap: controller.toggleMusic,
              );
            }),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: controller.onTapNewGame,
                      child: Image.asset(
                        'assets/images/main_button_1.png',
                        width: 213,
                        height: 66.8,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: controller.onTapContinue,
                      child: Image.asset(
                        controller.getStorageService.first
                            ? 'assets/images/main_button_2_invisible.png'
                            : 'assets/images/main_button_2_visible.png',
                        width: 213,
                        height: 66.8,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: controller.onTapStore,
                      child: Image.asset(
                        'assets/images/main_button_3.png',
                        width: 213,
                        height: 66.8,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
