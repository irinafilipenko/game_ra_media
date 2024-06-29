import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward();

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    Timer(const Duration(milliseconds: 2000), () {
      Get.toNamed('/main');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
