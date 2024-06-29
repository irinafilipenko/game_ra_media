import 'package:get/get.dart';

import 'dart:math';

import 'package:ra_media_test/services/get_storadge_service.dart';

class StartGameController extends GetxController {
  GetStorageService getStorageService = Get.find();

  var reels = List.generate(3, (index) => List.generate(3, (index) => 0)).obs;
  RxBool isSpinning = false.obs;
  RxList winningIndices = <int>[].obs;
  // RxInt currentStartGameStep = 1.obs;
  RxInt spinCount = 0.obs;

  final random = Random();

  final symbols = [
    'assets/images/dice_start_game/dice.png',
    'assets/images/dice_start_game/moon.png',
    'assets/images/dice_start_game/star.png',
    'assets/images/dice_start_game/totem.png',
    'assets/images/dice_start_game/gem.png',
    'assets/images/dice_start_game/seven.png',
    'assets/images/dice_start_game/skull.png',
    'assets/images/dice_start_game/ring.png',
    'assets/images/dice_start_game/fair.png',
  ];

  @override
  onInit() {
    super.onInit();

    spin(deductPoints: false);
  }

  void spin({bool deductPoints = true}) {
    if (isSpinning.value) return;

    isSpinning.value = true;
    winningIndices.clear();
    spinCount.value++;

    if (deductPoints) {
      getStorageService.point.value -=
          100; // Выполняем только если deductPoints = true
    }

    if (spinCount.value == 3) {
      // При втором нажатии на кнопку "SPIN" три элемента в ряд обязательно совпадут
      int fixedSymbol = random.nextInt(symbols.length);
      int randomRow = random.nextInt(reels.length);
      for (int col = 0; col < reels[randomRow].length; col++) {
        reels[randomRow][col] = fixedSymbol;
      }
      // Остальные ряды заполняем случайными символами
      for (int i = 0; i < reels.length; i++) {
        if (i == randomRow) continue; // Пропускаем фиксированный ряд
        for (int j = 0; j < reels[i].length; j++) {
          reels[i][j] = random.nextInt(symbols.length);
        }
      }
    } else {
      // Случайное заполнение символами
      for (int i = 0; i < reels.length; i++) {
        for (int j = 0; j < reels[i].length; j++) {
          reels[i][j] = random.nextInt(symbols.length);
        }
      }
    }

    checkWinningCombinations();

    isSpinning.value = false;
    // if (getStorageService.point.value < 100) {
    //   currentStartGameStep.value = 2;
    // }
    getStorageService.dataSave();
  }

  onPlusStep() {
    spinCount.value += 1;
  }

  onTabLastStepButton() {
    if (spinCount.value == 9) {
      Get.toNamed('/screen-saver');
      spinCount.value = 0;
    } else {
      onPlusStep();
    }
  }

  void checkWinningCombinations() {
    for (int row = 0; row < reels.length; row++) {
      if (reels[row][0] == reels[row][1] && reels[row][1] == reels[row][2]) {
        winningIndices.add(row);
      }
    }
  }
}
