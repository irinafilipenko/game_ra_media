import 'package:flutter/material.dart';

import 'package:ra_media_test/screens/splash/components/splash_body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(children: [
          Image.asset(
            'assets/images/splash.png',
            // fit: BoxFit.cover,
          ),
          const SplashBody()
        ]));
  }
}

// class SplashScreen extends StatefulWidget {
//   static String routeName = '/splash';
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );
//
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
//       ..addListener(() {
//         setState(() {});
//       });
//
//     _controller.forward();
//
//     Timer(Duration(seconds: 3), () {
//       Get.toNamed('/main');
//       // Get.off(MainScreen());
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: AnimatedOpacity(
//           opacity: _animation.value,
//           duration: const Duration(milliseconds: 200),
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
