import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    super.key,
    required this.text,
    required this.icon,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(),
          child: Icon(
            icon,
            size: 32,
            color: Colors.grey,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
