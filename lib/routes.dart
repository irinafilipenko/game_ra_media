import 'package:get/get.dart';
import 'package:ra_media_test/bindings.dart';
import 'package:ra_media_test/screens/main/main_screen.dart';
import 'package:ra_media_test/screens/screen_saver/screen_saver_screen.dart';
import 'package:ra_media_test/screens/second_game/second_game_screen.dart';
import 'package:ra_media_test/screens/splash/splash_screen.dart';
import 'package:ra_media_test/screens/start_game/start_game_screen.dart';
import 'package:ra_media_test/screens/store/store_screen.dart';
import 'package:ra_media_test/screens/story_game/story_screen.dart';

class AppScreen {
  static final routes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      transitionDuration: const Duration(milliseconds: 100),
      binding: Binding(),
    ),
    GetPage(
      name: MainScreen.routeName,
      page: () => const MainScreen(),
      transitionDuration: const Duration(milliseconds: 100),
      binding: Binding(),
    ),
    GetPage(
      name: StoreScreen.routeName,
      page: () => const StoreScreen(),
      transition: Transition.fadeIn, // Использование встроенной анимации
      transitionDuration: const Duration(milliseconds: 100),
      binding: Binding(),
    ),
    GetPage(
      name: StoryScreen.routeName,
      page: () => const StoryScreen(),
      binding: Binding(),
      transition: Transition.fadeIn, // Использование встроенной анимации
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: StartGameScreen.routeName,
      page: () => const StartGameScreen(),
      binding: Binding(),
      transition: Transition.fadeIn, // Использование встроенной анимации
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: ScreenSaverScreen.routeName,
      page: () => const ScreenSaverScreen(),
      binding: Binding(),
      transition: Transition.fadeIn, // Использование встроенной анимации
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: SecondGameScreen.routeName,
      page: () => const SecondGameScreen(),
      binding: Binding(),
      transition: Transition.fadeIn, // Использование встроенной анимации
      transitionDuration: const Duration(milliseconds: 100),
    ),
  ];
}
