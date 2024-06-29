import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra_media_test/components/custom_app_bar.dart';

import 'package:ra_media_test/screens/store/components/store_controller.dart';

class StoreBody extends GetView<StoreController> {
  const StoreBody({super.key});

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
                image: 'assets/images/home_button.png',
                onTap: () {
                  Get.toNamed('/main');
                },
              );
            }),
            const SizedBox(
              height: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.addChips(100000);
                      },
                      child: Image.asset(
                        'assets/images/store_picture_1.png',
                        width: 148,
                        height: 208.59,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.addChips(700000);
                      },
                      child: Image.asset(
                        'assets/images/store_picture_2.png',
                        width: 148,
                        height: 208.59,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.addChips(5000000);
                      },
                      child: Image.asset(
                        'assets/images/store_picture_3.png',
                        width: 148,
                        height: 208.59,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.addChips(100000000);
                      },
                      child: Image.asset(
                        'assets/images/store_picture_4.png',
                        width: 148,
                        height: 208.59,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
