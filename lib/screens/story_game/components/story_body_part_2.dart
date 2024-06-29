import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra_media_test/components/custom_app_bar.dart';

import 'package:ra_media_test/screens/story_game/story_controller.dart';

class StoryBodyPart2 extends GetView<StoryController> {
  const StoryBodyPart2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/story_background_2.png',
          // fit: BoxFit.cover,
        ),
        controller.getStorageService.currentStep.value == 3 ||
                controller.getStorageService.currentStep.value == 6
            ? SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Get.width / 14,
                      // right: 20,
                      top: controller.getStorageService.currentStep.value == 3
                          ? Get.width / 24
                          : 108),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/rules.png',
                        width: 353.06,
                        height: 457,
                      ),
                      controller.getStorageService.currentStep.value == 6
                          ? Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed('/start-game');
                                },
                                child: Image.asset(
                                  'assets/images/start_button.png',
                                  width: 213,
                                  height: 66.8,
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        // controller.currentStep.value == 6
        //     ? Image.asset(
        //         'assets/images/start_button.png',
        //         width: 213,
        //         height: 66.8,
        //       )
        //     : SizedBox(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
            child: CustomAppBar(
              point: controller.getStorageService.point.value.toString(),
              image: 'assets/images/home_button.png',
              onTap: () {
                Get.toNamed('/main');
              },
            ),
          ),
        ),
        controller.getStorageService.currentStep.value == 4
            ? Positioned(
                top: Get.width / 2.5,
                left: Get.width / 13,
                width: 345,
                height: 172.57,
                child: Image.asset('assets/images/story_text_3.png'))
            : controller.getStorageService.currentStep.value == 5
                ? Positioned(
                    top: Get.width / 2.5,
                    left: Get.width / 13,
                    width: 345,
                    height: 172.57,
                    child: Image.asset('assets/images/story_text_4.png'))
                : const SizedBox(),
        // Obx(() {
        //   return Positioned(
        //     top: 100,
        //     left: 30,
        //     child: SafeArea(
        //       child: Image.asset(
        //         controller.currentStep.value == 0
        //             ? 'assets/images/story_text_0.png'
        //             : controller.currentStep.value == 1
        //                 ? 'assets/images/story_text_1.png'
        //                 : controller.currentStep.value == 2
        //                     ? 'assets/images/story_text_2.png'
        //                     : 'assets/images/story_text_0.png',
        //         width: 345,
        //         height: 172.57,
        //         // fit: BoxFit.cover,
        //       ),
        //     ),
        //   );
        // }),
        controller.getStorageService.currentStep.value == 3 ||
                controller.getStorageService.currentStep.value == 4 ||
                controller.getStorageService.currentStep.value == 5
            ? Positioned(
                bottom: -5,
                left: 32,
                child: Image.asset(
                  'assets/images/maria.png',
                  width: controller.getStorageService.currentStep.value == 3
                      ? 278.61
                      : 307.22,
                  height: controller.getStorageService.currentStep.value == 3
                      ? 487
                      : 537,
                  // fit: BoxFit.cover,
                ),
              )
            : const SizedBox(),
        controller.getStorageService.currentStep.value == 3 ||
                controller.getStorageService.currentStep.value == 4 ||
                controller.getStorageService.currentStep.value == 5
            ? Positioned(
                bottom: 36,
                left: Get.width / 9,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF7236DA), Color(0xFF07D5FE)],
                    ),
                    // Optional: for rounded corners
                  ),
                  padding: const EdgeInsets.all(2), // Space for the border
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: 317,
                    height: 144.57,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0C0C28), Color(0xFF1D1D44)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 4.14),
                          blurRadius: 4.14,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.onChangeStep();
                            // if (controller.currentStep.value == 5) {
                            //   controller.onChangeStep();
                            // }
                          },
                          child: Text(
                            controller.getStorageService.currentStep.value == 3
                                ? "What happens if we complete them?"
                                : controller.getStorageService.currentStep
                                            .value ==
                                        4
                                    ? "What's your plan afterward?"
                                    : controller.getStorageService.currentStep
                                                .value ==
                                            5
                                        ? "I'll help you. Let's lift the curse together."
                                        : "",
                            style: const TextStyle(
                              fontFamily: 'Alatsi',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF04D9FE),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        controller.getStorageService.currentStep.value == 4
                            ? InkWell(
                                onTap: () {
                                  controller.onChangeStep();
                                },
                                child: const Text(
                                  "How do you cope with being here alone?",
                                  style: TextStyle(
                                    fontFamily: 'Alatsi',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF04D9FE),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            if (controller
                                    .getStorageService.currentStep.value ==
                                5) {
                              Get.toNamed('/main');
                            } else {
                              controller.onChangeStep();
                            }
                          },
                          child: Text(
                            controller.getStorageService.currentStep.value == 3
                                ? "How did you find this scroll?"
                                : controller.getStorageService.currentStep
                                            .value ==
                                        4
                                    ? "What will happen when the town is \n freed from the curse?"
                                    : controller.getStorageService.currentStep
                                                .value ==
                                            5
                                        ? "This is too risky. I need to leave."
                                        : "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Alatsi',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF04D9FE),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
