import 'package:flutter/material.dart';

import 'custom_icon.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({
    super.key,
    required this.iconData,
    required this.text,
    this.fontSize = 16,
    required this.iconColor,
    required this.textColor,
  });

  final IconData iconData;
  final String text;
  final double fontSize;
  final Color iconColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomIcon(
          color: iconColor,
          icon: Icon(
            iconData,
            size: 24,
            color: iconColor.withOpacity(.7),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
