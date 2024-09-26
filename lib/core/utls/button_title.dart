import 'package:flutter/material.dart';

class ButtonTitle extends StatelessWidget {
  const ButtonTitle({
    super.key,
    required this.text,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'cairo',
      ),
    );
  }
}
