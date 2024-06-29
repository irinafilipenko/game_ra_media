import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra_media_test/screens/splash/splash_controller.dart';

class SplashBody extends GetView<SplashController> {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/loading.png',
            width: 119.93,
            height: 16.39,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              Image.asset(
                'assets/images/frame_preloader.png',
                width: 168,
                height: 35,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 5,
                left: 18,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 134,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedBuilder(
                        animation: controller.animation,
                        builder: (context, child) {
                          return FractionallySizedBox(
                            widthFactor: controller.animation.value,
                            child: Container(
                              height: 25,
                              width: 130,
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF0878CD),
                                    Color(0xFFD50569)
                                  ],
                                  stops: [0.0, 1.0],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/please.png',
                width: 85.65,
                height: 14.83,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/wait.png',
                width: 57.07,
                height: 14.83,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
