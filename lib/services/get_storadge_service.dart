import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStorageService extends GetxService {
  late final SharedPreferences prefs;
  late bool first;
  RxInt point = 1000.obs;
  RxInt currentStep = 0.obs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    // await dataSave();
    await dataLoad();
    return this;
  }

  dataLoad() async {
    point.value = prefs.getInt('point') ?? 1000;
    first = prefs.getBool('first') ?? true;
    currentStep.value = prefs.getInt('current_step') ?? 0;
  }

  dataSave() async {
    await prefs.setInt('point', point.value);
    await prefs.setBool('first', first);
    await prefs.setInt('current_step', currentStep.value);
  }

  Future<void> doFirstWent() async {
    first = false;
    dataSave();
  }
}
