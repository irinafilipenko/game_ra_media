import 'package:flutter/material.dart';

import 'package:ra_media_test/constants.dart';

class CustomAppBar extends StatelessWidget {
  final String point;
  final String image;
  final Function() onTap;

  const CustomAppBar(
      {super.key,
      required this.point,
      required this.image,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          // onTap: () {
          //   Get.toNamed('/main');
          // },
          child: Image.asset(
            image,
            width: 32,
            height: 32,
            // fit: BoxFit.cover,
          ),
        ),
        const Spacer(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7236DA), Color(0xFF07D5FE)],
                ),
                // Optional: for rounded corners
              ),
              padding: const EdgeInsets.all(2), // Space for the border
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                width: 137,
                height: 30,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0C0C28), Color(0xFF1D1D44)],
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerRight, //
                  child: Text(
                    point,
                    style: kMainTextStyleTextStyle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: -15,
              top: -5,
              child: Image.asset(
                'assets/images/drum.png',
                width: 44,
                height: 44,
                // fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
