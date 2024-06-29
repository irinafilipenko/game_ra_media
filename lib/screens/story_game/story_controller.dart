import 'package:get/get.dart';
import 'package:ra_media_test/services/get_storadge_service.dart';

class StoryController extends GetxController {
  GetStorageService getStorageService = Get.find();
  // RxInt currentStep = 0.obs;

  onChangeStep() {
    getStorageService.currentStep.value += 1;
    // print("Hello");
    // print(getStorageService.currentStep.value);
  }
}
