import 'package:flutter/material.dart';

import '../../../../../core/helper/AssetsData.dart';
import '../../../../../core/utls/custom_drop_down_button.dart';

class EditDropDown extends StatefulWidget {
  EditDropDown({
    super.key,
    required this.genderIcon,
    required this.gender,
  });
  IconData? genderIcon;
  String? gender;
  @override
  State<EditDropDown> createState() => _EditDropDownState();
}

class _EditDropDownState extends State<EditDropDown> {
  String? profileImage;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      genderIcon: widget.genderIcon!,
      selectedItem: widget.gender,
      onChanged: (newValue) {
        setState(() {
          widget.gender = newValue;
          if (widget.gender == 'Male') {
            widget.genderIcon = Icons.male_rounded;
            profileImage = AssetsData.kMaleImage;
          } else {
            widget.genderIcon = Icons.female_rounded;
            profileImage = AssetsData.kFeMaleImage;
          }
        });
      },
    );
  }
}
