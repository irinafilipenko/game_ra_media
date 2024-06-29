import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra_media_test/components/custom_app_bar.dart';

import 'package:ra_media_test/constants.dart';
import 'package:ra_media_test/screens/second_game/second_game_controller.dart';

class SecondGameBody extends GetView<SecondGameController> {
  const SecondGameBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(milliseconds: 100), () {
    //   controller.spin(deductPoints: false);
    // });

    return Obx(() {
      return Stack(
        children: [
          Image.asset(controller.spinCountSecondScreen.value == 8
                  ? "assets/images/finish_background.png"
                  : "assets/images/screen_saver_background.png"
              // fit: BoxFit.cover,
              ),
          controller.spinCountSecondScreen.value == 6
              ? Image.asset('assets/images/winner_background.png')
              : const SizedBox(),
          controller.spinCountSecondScreen.value == 0 ||
                  controller.spinCountSecondScreen.value == 1 ||
                  controller.spinCountSecondScreen.value == 2 ||
                  controller.spinCountSecondScreen.value == 3 ||
                  controller.spinCountSecondScreen.value == 5
              ? SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 25),
                    child: Column(
                      children: [
                        CustomAppBar(
                          point: controller.getStorageService.point.value
                              .toString(),
                          image: 'assets/images/home_button.png',
                          onTap: () {
                            Get.toNamed('/main');
                            controller.spinCountSecondScreen.value = 0;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              'assets/images/game_desk_2.png',
                              width: double.infinity,
                              height: 447.78,
                              fit: BoxFit.contain,
                            ),
                            Positioned(
                              top: 38,
                              left: 38,
                              child: SizedBox(
                                width: 280,
                                child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 0,
                                  ),
                                  itemCount: 12,
                                  itemBuilder: (context, index) {
                                    int row = index ~/ 3;
                                    int col = index % 3;
                                    bool isWinning =
                                        controller.winningIndices.contains(row);
                                    return Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        if (isWinning)
                                          Positioned(
                                            top: -32,
                                            left: -32,
                                            width: 157.25,
                                            height: 151.14,
                                            child: Image.asset(
                                              'assets/images/dice_second_game/glow_second.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        SizedBox(
                                          width: 90,
                                          height: 90,
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
                          ],
                        ),
                        controller.spinCountSecondScreen.value == 1 ||
                                controller.spinCountSecondScreen.value == 0 ||
                                controller.spinCountSecondScreen.value == 3 ||
                                controller.spinCountSecondScreen.value == 5
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    controller.spinCountSecondScreen.value == 5
                                        ? 'assets/images/total_match.png'
                                        : 'assets/images/second_game_chips.png',
                                    width: 257,
                                    height: 74.33,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(
                                    height: 5,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                kMainRadiusLinearGradient),
                                        padding: const EdgeInsets.all(2),
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
                                            alignment: Alignment.centerRight,
                                            child: Text("100",
                                                style: kMainTextStyleTextStyle),
                                          ),
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
                            : const SizedBox(),
                      ],
                    ),
                  ),
                )
              : controller.spinCountSecondScreen.value == 4 ||
                      controller.spinCountSecondScreen.value == 7
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 25),
                      child: Column(
                        children: [
                          SafeArea(
                            child: CustomAppBar(
                              point: controller.getStorageService.point.value
                                  .toString(),
                              image: 'assets/images/home_button.png',
                              onTap: () {
                                Get.toNamed('/main');
                                controller.spinCountSecondScreen.value = 0;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Image.asset(
                              controller.spinCountSecondScreen.value == 4
                                  ? "assets/images/second_game_desc_0.png"
                                  : "assets/images/second_game_desc_1.png"),
                          const SizedBox(
                            height: 35,
                          ),
                          InkWell(
                            onTap: controller.onPlusStep,
                            child: Image.asset(
                              "assets/images/next_button.png",
                              width: 213,
                              height: 66.8,
                            ),
                          ),
                        ],
                      ),
                    )
                  : controller.spinCountSecondScreen.value == 6
                      ? SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 25),
                            child: Column(
                              children: [
                                CustomAppBar(
                                  point: controller
                                      .getStorageService.point.value
                                      .toString(),
                                  image: 'assets/images/home_button.png',
                                  onTap: () {
                                    Get.toNamed('/main');
                                    controller.spinCountSecondScreen.value = 0;
                                  },
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Image.asset(
                                      'assets/images/winner.png',
                                      width: 364.97,
                                      height: 166,
                                      // fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      'assets/images/many.png',
                                      width: 329,
                                      height: 71.04,
                                      // fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 45,
                                    ),
                                    InkWell(
                                      onTap: controller.onPlusStep,
                                      child: Image.asset(
                                        'assets/images/get_button.png',
                                        width: 213,
                                        height: 66.8,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
          controller.spinCountSecondScreen.value == 2
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
                      Image.asset(
                        'assets/images/maria.png',
                        width: 225.41,
                        height: 394,
                        // fit: BoxFit.cover,
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
                                  controller.spin();
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
              : const SizedBox(),
          controller.spinCountSecondScreen.value == 8
              ? Column(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: CustomAppBar(
                          point: controller.getStorageService.point.value
                              .toString(),
                          image: 'assets/images/home_button.png',
                          onTap: () {
                            Get.toNamed('/main');
                            controller.spinCountSecondScreen.value = 0;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/images/finish_text.png',

                        width: 345,
                        height: 172.57,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          controller.spinCountSecondScreen.value == 8
              ? Positioned(
                  bottom: -5,
                  left: 40,
                  child: Image.asset(
                    'assets/images/maria.png',
                    width: 327.81,
                    height: 573,
                    // fit: BoxFit.cover,
                  ),
                )
              : const SizedBox(),
          controller.spinCountSecondScreen.value == 8
              ? Positioned(
                  bottom: 0,
                  left: Get.width / 4,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 20),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/leave_button.png',
                          width: 213,
                          height: 66.8,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      );
    });
  }
}
