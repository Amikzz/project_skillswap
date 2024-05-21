import 'package:flutter/material.dart';

class StartupElevatedButton extends StatelessWidget {

  final void Function() onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const StartupElevatedButton({super.key, required this.onPressed, required this.text, this.backgroundColor, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        animationDuration: const Duration(milliseconds: 1000),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: const Size(220, 60),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shadowColor: Colors.grey,
        elevation: 8,
      ),
      onPressed: () { onPressed(); },
      child: Text(
          text,
          style: TextStyle(
            color: foregroundColor,
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
      ),
    );
  }
}
