import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ra_media_test/components/custom_app_bar.dart';
import 'package:ra_media_test/services/get_storadge_service.dart';

class ScreenSaverBody extends StatefulWidget {
  const ScreenSaverBody({super.key});

  @override
  State<ScreenSaverBody> createState() => _ScreenSaverBodyState();
}

class _ScreenSaverBodyState extends State<ScreenSaverBody> {
  GetStorageService getStorageService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/screen_saver_background.png'
            // fit: BoxFit.cover,
            ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: CustomAppBar(
              point: getStorageService.point.value.toString(),
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
              'assets/images/screen_saver_text.png',

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
          bottom: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/second-game');
                },
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(
                      'assets/images/play_button.png',
                      width: 46,
                      height: 46.7,
                      // fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/play_triangle_button.png',
                      width: 24,
                      height: 24,
                      // fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
