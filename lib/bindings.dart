import 'package:get/get.dart';
import 'package:ra_media_test/screens/main/main_controller.dart';
import 'package:ra_media_test/screens/second_game/second_game_controller.dart';
import 'package:ra_media_test/screens/splash/splash_controller.dart';
import 'package:ra_media_test/screens/start_game/start_game_controller.dart';
import 'package:ra_media_test/screens/story_game/story_controller.dart';

import 'screens/store/components/store_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<StoreController>(
      () => StoreController(),
    );
    Get.lazyPut<StoryController>(
      () => StoryController(),
    );
    Get.lazyPut<StartGameController>(
      () => StartGameController(),
    );
    Get.lazyPut<SecondGameController>(
      () => SecondGameController(),
    );
  }
}
