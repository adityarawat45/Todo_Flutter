import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bColor;
  VoidCallback onPressed;
  Button({super.key, required this.text, required this.onPressed,required this.bColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: bColor,
        elevation: 1,
        child: text.text
            .color(Vx.white)
            .semiBold
            .size(12)
            .textStyle(GoogleFonts.poppins())
            .make());
  }
}
