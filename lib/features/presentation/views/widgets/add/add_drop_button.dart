import 'package:flutter/material.dart';

import '../../../../../core/utls/custom_drop_down_button.dart';

class AddDropDownButton extends StatelessWidget {
  const AddDropDownButton({
    super.key,
    required this.gender,
    required this.profileImage,
    required this.genderIcon,
    required this.onChanged,
  });
  final String? gender, profileImage;
  final IconData? genderIcon;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      genderIcon: genderIcon ?? Icons.transgender_rounded,
      selectedItem: gender,
      onChanged: onChanged,
    );
  }
}
