import 'dart:math';

import 'package:get/get.dart';
import 'package:ra_media_test/services/get_storadge_service.dart';

class SecondGameController extends GetxController {
  GetStorageService getStorageService = Get.find();
  var reels = List.generate(4, (index) => List.generate(3, (index) => 0)).obs;
  RxBool isSpinning = false.obs;
  RxList<int> winningIndices = <int>[].obs;
  RxInt spinCountSecondScreen = 0.obs;

  final random = Random();

  final symbols = [
    'assets/images/dice_second_game/crown.png',
    'assets/images/dice_second_game/cards.png',
    'assets/images/dice_second_game/drum_dice.png',
    'assets/images/dice_second_game/chips.png',
    'assets/images/dice_second_game/card_suit.png',
    'assets/images/dice_second_game/gold.png',
    'assets/images/dice_second_game/heart.png',
    'assets/images/dice_second_game/bone.png',
    'assets/images/dice_start_game/ring.png',
    'assets/images/dice_start_game/totem.png',
  ];

  @override
  void onInit() {
    super.onInit();
    spin(deductPoints: false);
  }

  void spin({bool deductPoints = true}) {
    if (isSpinning.value) return;

    isSpinning.value = true;
    winningIndices.clear();
    spinCountSecondScreen.value++;
    if (deductPoints) {
      getStorageService.point.value -= 100;
    }

    if (spinCountSecondScreen.value == 3) {
      // При третьем нажатии на кнопку "SPIN" три элемента в ряд обязательно совпадут
      int fixedSymbol = random.nextInt(symbols.length);
      int randomRow = random.nextInt(reels.length);
      for (int col = 0; col < reels[randomRow].length; col++) {
        reels[randomRow][col] = fixedSymbol;
      }
      // Остальные ряды заполняем случайными символами
      for (int i = 0; i < reels.length; i++) {
        if (i == randomRow) continue;
        for (int j = 0; j < reels[i].length; j++) {
          reels[i][j] = random.nextInt(symbols.length);
        }
      }
    } else if (spinCountSecondScreen.value == 4) {
      // При пятом нажатии на кнопку "SPIN" в каждом ряду будет по три одинаковых элемента
      for (int i = 0; i < reels.length; i++) {
        int fixedSymbol = random.nextInt(symbols.length);
        reels[i][0] = fixedSymbol;
        reels[i][1] = fixedSymbol;
        reels[i][2] = fixedSymbol;
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
    getStorageService.dataSave();
  }

  onPlusStep() {
    spinCountSecondScreen.value += 1;
  }

  void checkWinningCombinations() {
    for (int row = 0; row < reels.length; row++) {
      if (reels[row][0] == reels[row][1] && reels[row][1] == reels[row][2]) {
        winningIndices.add(row);
      }
    }
  }
}
