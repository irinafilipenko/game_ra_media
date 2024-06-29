import 'package:get/get.dart';
import 'package:ra_media_test/services/get_storadge_service.dart';

class StoreController extends GetxController {
  GetStorageService getStorageService = Get.find();

  void addChips(int amount) {
    getStorageService.point.value += amount;
    getStorageService.dataSave();
  }
}
