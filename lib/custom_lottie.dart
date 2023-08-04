import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottie extends StatelessWidget {
  const CustomLottie(this.lottieName, {super.key, this.height, this.width})
      : basePath = 'assets/lottie/';

  const CustomLottie.demo(this.lottieName, {super.key, this.height, this.width})
      : basePath = 'assets/lottie/demo/';

  final String? basePath;
  final String lottieName;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Lottie.asset(
        '$basePath$lottieName.json',
        width: width ?? 300,
        height: height ?? 300,
        fit: BoxFit.fill,
      ),
    );
  }
}
