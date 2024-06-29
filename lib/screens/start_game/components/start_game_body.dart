import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra_media_test/components/custom_app_bar.dart';

import 'package:ra_media_test/constants.dart';
import 'package:ra_media_test/screens/start_game/start_game_controller.dart';

class StartGameBody extends GetView<StartGameController> {
  const StartGameBody({super.key});

  @override
  Widget build(BuildContext context) {
    // print("${controller.spinCount}");
    Future.delayed(const Duration(milliseconds: 100), () {
      controller.spin(deductPoints: false);
    });
    return Obx(() {
      return Stack(
        children: [
          Image.asset(
            controller.spinCount.value == 0 ||
                    controller.spinCount.value == 1 ||
                    controller.spinCount.value == 2 ||
                    controller.spinCount.value == 3 ||
                    controller.spinCount.value == 5 ||
                    controller.spinCount.value == 7 ||
                    controller.spinCount.value == 8
                ? 'assets/images/game_background.png'
                : "assets/images/story_background_2.png",
            // fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: SafeArea(
                child: Column(
              children: [
                CustomAppBar(
                  point: controller.getStorageService.point.value.toString(),
                  image: 'assets/images/home_button.png',
                  onTap: () {
                    Get.toNamed('/main');
                    controller.spinCount.value = 0;
                  },
                ),
                controller.spinCount.value == 0 ||
                        controller.spinCount.value == 1 ||
                        controller.spinCount.value == 2 ||
                        controller.spinCount.value == 3 ||
                        controller.spinCount.value == 5 ||
                        controller.spinCount.value == 7 ||
                        controller.spinCount.value == 8
                    ? Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset(
                                'assets/images/game_desk_1.png',
                                width: double.infinity,
                                height: 474.54,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 75,
                                left: 38,
                                child: SizedBox(
                                  width: 280,
                                  // height: 380,
                                  child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 8,
                                            crossAxisSpacing: 0,
                                            mainAxisExtent: 100),
                                    itemCount: 9,
                                    itemBuilder: (context, index) {
                                      int row = index ~/ 3;
                                      int col = index % 3;
                                      bool isWinning = controller.winningIndices
                                          .contains(row);
                                      return Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          if (isWinning)
                                            Positioned(
                                              top: -45,
                                              left: -45,
                                              // right: -10,
                                              // bottom: -10,
                                              width: 185,
                                              height: 185,
                                              child: Image.asset(
                                                'assets/images/dice_start_game/glow.png',
                                                // width: 300,
                                                // height: 300,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          SizedBox(
                                            width: 118,
                                            height: 118,
                                            child: Image.asset(
                                              controller.symbols[
                                                  controller.reels[row][col]],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // controller.currentStartGameStep.value == 1
                              controller.spinCount.value == 5
                                  ? Positioned(
                                      bottom: -38,
                                      left: 48,
                                      child: Image.asset(
                                        'assets/images/matches_desk.png',
                                        width: 257,
                                        height: 74.33,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  : controller.spinCount.value == 1 ||
                                          controller.spinCount.value == 2 ||
                                          controller.spinCount.value == 3
                                      ? Positioned(
                                          bottom: -38,
                                          left: 48,
                                          child: Image.asset(
                                            'assets/images/chips_desk.png',
                                            width: 257,
                                            height: 74.33,
                                            fit: BoxFit.contain,
                                          ),
                                        )
                                      : controller.spinCount.value == 7
                                          ? Positioned(
                                              bottom: -38,
                                              left: 48,
                                              child: Image.asset(
                                                'assets/images/spins_desk.png',
                                                width: 257,
                                                height: 74.33,
                                                fit: BoxFit.contain,
                                              ),
                                            )
                                          : const SizedBox()
                            ],
                          ),
                          controller.spinCount.value == 8
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    InkWell(
                                      onTap: controller.isSpinning.value
                                          ? null
                                          : controller.spin,
                                      child: Image.asset(
                                        'assets/images/spin_button.png',
                                        width: 80,
                                        height: 57.2,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/images/minus_button.png',
                                            width: 32,
                                            height: 32.5,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              gradient:
                                                  kMainRadiusLinearGradient
                                              // Optional: for rounded corners
                                              ),
                                          padding: const EdgeInsets.all(
                                              2), // Space for the border
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            width: 127,
                                            height: 41,
                                            decoration: BoxDecoration(
                                              gradient: kMainFillLinearGradient,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.25),
                                                  offset: const Offset(0, 4.14),
                                                  blurRadius: 4.14,
                                                  spreadRadius: 0,
                                                ),
                                              ],
                                            ),
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text("100",
                                                    style:
                                                        kMainTextStyleTextStyle)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/images/plus_button.png',
                                            width: 32,
                                            height: 32.5,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Image.asset(
                            controller.spinCount.value == 4
                                ? "assets/images/start_game_desc_0.png"
                                : controller.spinCount.value == 6
                                    ? "assets/images/start_game_desc_1.png"
                                    : controller.spinCount.value == 9
                                        ? "assets/images/start_game_desk_2.png"
                                        : "assets/images/start_game_desc_0.png",
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          InkWell(
                            onTap: controller.onTabLastStepButton,
                            child: Image.asset(
                              "assets/images/next_button.png",
                              width: 213,
                              height: 66.8,
                            ),
                          ),
                        ],
                      ),
                // controller.currentStartGameStep.value == 1

                // : SizedBox()
              ],
            )),
          ),
          controller.spinCount.value == 8
              ? Positioned(
                  bottom: -5,
                  left: 15,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const SizedBox(
                        width: 360,
                        height: 394,
                      ),
                      Align(
                        child: Image.asset(
                          'assets/images/maria.png',
                          width: 225.41,
                          height: 394,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 130,
                        child: Stack(
                          // clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              height: 138,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  'assets/images/start_game_text.png',
                                  width: 223,
                                  height: 111.54,
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 47,
                              child: InkWell(
                                onTap: () {
                                  // print("${controller.spinCount}");
                                  controller.onPlusStep();
                                  // Get.toNamed('/store');
                                },
                                child: Image.asset(
                                  'assets/images/start_buy_chips.png',
                                  width: 133.92,
                                  height: 42,
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox()
        ],
      );
    });
  }
}
