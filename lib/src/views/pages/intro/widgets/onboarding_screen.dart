import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    required this.title,
    required this.desc,
    required this.imageUrl,
  });

  final String title;
  final String desc;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 60.0,
            ),
            child: Image.asset(imageUrl),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 23.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              desc,
              style: const TextStyle(
                height: 1.5,
                letterSpacing: 0.7,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
