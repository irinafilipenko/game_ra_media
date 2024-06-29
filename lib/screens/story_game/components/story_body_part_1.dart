import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ra_media_test/components/custom_app_bar.dart';
import 'package:ra_media_test/screens/story_game/story_controller.dart';

class StoryBodyPart1 extends GetView<StoryController> {
  const StoryBodyPart1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/story_background_1.png',
          // fit: BoxFit.cover,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: CustomAppBar(
              point: controller.getStorageService.point.value.toString(),
              image: 'assets/images/home_button.png',
              onTap: () {
                Get.toNamed('/main');
              },
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 30,
          child: SafeArea(
            child: Image.asset(
              controller.getStorageService.currentStep.value == 0
                  ? 'assets/images/story_text_0.png'
                  : controller.getStorageService.currentStep.value == 1
                      ? 'assets/images/story_text_1.png'
                      : controller.getStorageService.currentStep.value == 2
                          ? 'assets/images/story_text_2.png'
                          : 'assets/images/story_text_0.png',
              width: 345,
              height: 172.57,
              // fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -5,
          left: 40,
          child: Image.asset(
            'assets/images/maria.png',
            width: 327.81,
            height: 573,
            // fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 36,
          left: 45,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7236DA), Color(0xFF07D5FE)],
              ),
              // Optional: for rounded corners
            ),
            padding: EdgeInsets.all(2), // Space for the border
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: 317,
              height: 144.57,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0C0C28), Color(0xFF1D1D44)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4.14),
                    blurRadius: 4.14,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  controller.onChangeStep();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      controller.getStorageService.currentStep.value == 0
                          ? "Why are you here alone?"
                          : controller.getStorageService.currentStep.value == 1
                              ? "Why can't you leave?"
                              : controller.getStorageService.currentStep
                                          .value ==
                                      2
                                  ? "What kind of challenges?"
                                  : "Why are you here alone?",
                      style: TextStyle(
                        fontFamily: 'Alatsi',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF04D9FE),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.getStorageService.currentStep.value == 0
                          ? "What happened to the town?"
                          : controller.getStorageService.currentStep.value == 1
                              ? "How do you plan to save the town?"
                              : controller.getStorageService.currentStep
                                          .value ==
                                      3
                                  ? "Show me the scroll."
                                  : "What happened to the town?",
                      style: TextStyle(
                        fontFamily: 'Alatsi',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF04D9FE),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.getStorageService.currentStep.value == 0
                          ? "How can the curse be lifted?"
                          : controller.getStorageService.currentStep.value == 1
                              ? "Do you have a plan?"
                              : controller.getStorageService.currentStep
                                          .value ==
                                      2
                                  ? "How can I help you?"
                                  : "How can the curse be lifted?",
                      style: TextStyle(
                        fontFamily: 'Alatsi',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF04D9FE),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
