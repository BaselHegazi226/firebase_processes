import 'package:copy_firebase_process/core/helper/constant.dart';
import 'package:flutter/material.dart';

class EditIcon extends StatelessWidget {
  const EditIcon({
    super.key,
    required this.editPressed,
  });
  final void Function()? editPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: editPressed,
      icon: Icon(
        Icons.edit_rounded,
        size: 40,
        color: kEnableButtonColor,
      ),
    );
  }
}
