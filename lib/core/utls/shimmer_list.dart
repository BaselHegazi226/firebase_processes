import 'package:copy_firebase_process/core/utls/custom_shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({
    super.key,
    required this.length,
  });
  final int length;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CustomShimmerEmpDataDecor();
      },
    );
  }
}
