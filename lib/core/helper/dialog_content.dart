import 'package:flutter/material.dart';

class DialogContent extends StatelessWidget {
  final bool deleteAll;
  final IconData iconData;
  final Color contentColor;
  final VoidCallback onToggleDeleteAll;

  const DialogContent({
    Key? key,
    required this.deleteAll,
    required this.iconData,
    required this.contentColor,
    required this.onToggleDeleteAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onToggleDeleteAll,
          icon: Icon(
            iconData,
            color: contentColor,
            size: 36,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Delete all',
          style: TextStyle(
            fontSize: 20,
            color: contentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
