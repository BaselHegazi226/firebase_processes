import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    this.textColor = Colors.white,
    required this.backgroundColor,
    required this.shadowColor,
    required this.child,
  });
  final void Function()? onPressed;
  final Color textColor;
  final Color backgroundColor;
  final Color shadowColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shadowColor: shadowColor,
          elevation: 5,
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
