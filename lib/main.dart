import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ra_media_test/routes.dart';

import 'package:ra_media_test/screens/splash/splash_screen.dart';
import 'package:ra_media_test/services/get_storadge_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync<GetStorageService>(
      () async => await GetStorageService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // GetStorageService getStorageService = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'energise_test',
      // locale: getStorageService.languageLocal ?? ui.window.locale,
      // fallbackLocale: LocalizationService.fallbackLocale,
      // translations: LocalizationService(),
      defaultTransition: Transition.fade,

      initialRoute: SplashScreen.routeName,
      getPages: AppScreen.routes,
      useInheritedMediaQuery: true,
    );
  }
}
