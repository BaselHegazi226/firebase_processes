import 'package:flutter/material.dart';

import '../../../../../core/helper/constant.dart';

class EmpDataDecor extends StatelessWidget {
  const EmpDataDecor({
    super.key,
    required this.widget,
    required this.color,
  });
  final Widget widget;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .26,
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 7,
              color: kEmpDataDecorColor,
            ),
          ),
          child: SingleChildScrollView(
            child: widget,
          ),
        ),
      ),
    );
  }
}
