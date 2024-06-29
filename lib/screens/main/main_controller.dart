import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import 'package:ra_media_test/services/get_storadge_service.dart';

class MainController extends GetxController {
  GetStorageService getStorageService = Get.find();
  AudioPlayer audioPlayer = AudioPlayer();
  RxBool isPlaying = false.obs;

  void toggleMusic() async {
    if (isPlaying.value) {
      await audioPlayer.pause();
      isPlaying.value = false;
    } else {
      await audioPlayer.play(AssetSource('music/game_music.mp3'));
      isPlaying.value = true;
    }
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  onTapNewGame() {
    getStorageService.currentStep.value = 0;
    Get.toNamed('/story-game');
    getStorageService.doFirstWent();
  }

  onTapContinue() {
    if (getStorageService.first) {
      return;
    } else {
      Get.toNamed('/story-game');
    }
  }

  onTapStore() {
    Get.toNamed('/store');
    getStorageService.doFirstWent();
  }
}
