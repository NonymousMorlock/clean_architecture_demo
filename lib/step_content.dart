import 'package:clean_architecture_demo/custom_lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepContent extends StatelessWidget {
  const StepContent({
    super.key,
    required this.text,
    required this.lottie,
    this.width,
    this.height,
  }) : demo = false;

  const StepContent.demo({
    super.key,
    required this.text,
    required this.lottie,
    this.width,
    this.height,
  }) : demo = true;

  final String text;
  final String lottie;
  final bool demo;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        if (demo)
          CustomLottie.demo(lottie, height: height, width: width)
        else
          CustomLottie(lottie, height: height, width: width),
      ],
    );
  }
}
