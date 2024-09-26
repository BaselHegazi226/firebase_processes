import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.radius,
    required this.image,
  });
  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SvgPicture.asset(
        image,
        width: radius * 2, // Diameter is 2 * radius
        height: radius * 2,
        fit: BoxFit.cover,
      ),
    );
  }
}
