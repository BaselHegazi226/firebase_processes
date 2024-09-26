import 'package:copy_firebase_process/core/helper/custom_indicator.dart';
import 'package:copy_firebase_process/core/helper/custom_show_snack_bar.dart';
import 'package:copy_firebase_process/core/utls/button_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utls/custom_text_button.dart';
import '../../../manager/firebase_bloc/firebase_bloc.dart';

class AddButton extends StatefulWidget {
  const AddButton({
    super.key,
    required this.formKey,
    required this.gender,
    required this.profileImage,
    required this.autoValidateMode,
    required this.nameController,
    required this.positionController,
    required this.contactNumController,
    required this.onReset,
    required this.isEnableButton,
  });
  final GlobalKey<FormState> formKey;
  final String? gender, profileImage;
  final TextEditingController nameController,
      positionController,
      contactNumController;
  final AutovalidateMode autoValidateMode;
  final VoidCallback onReset;
  final bool isEnableButton;
  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  AutovalidateMode? autoValidateMode;
  @override
  Widget build(BuildContext context) {
    autoValidateMode = widget.autoValidateMode;
    return BlocConsumer<FirebaseBloc, FirebaseState>(
      listener: (context, state) {
        if (state is AddEmpSuccess) {
          addEventResult(context);
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          textColor: kButtonTextColor,
          backgroundColor: (widget.isEnableButton)
              ? kEnableButtonColor
              : kDisableButtonColor,
          shadowColor: kShadowButtonColor,
          onPressed: () async {
            if (widget.formKey.currentState!.validate()) {
              FocusScope.of(context).unfocus();
              addEvent(context);
            } else {
              setState(() {
                autoValidateMode = AutovalidateMode.always;
              });
            }
          },
          child: state is AddEmpLoading
              ? const CustomIndicator(
                  color: Colors.white,
                )
              : const ButtonTitle(text: 'Save'),
        );
      },
    );
  }

  void addEventResult(BuildContext context) {
    showSnackBar(context, 'success save');
    widget.onReset();
    clearFields();
    setState(() {
      autoValidateMode = AutovalidateMode.disabled;
    });
  }

  void addEvent(BuildContext context) {
    BlocProvider.of<FirebaseBloc>(context).add(
      AddEmpEvent(
        name: widget.nameController.text,
        gender: widget.gender ?? 'No gender',
        image: widget.profileImage!,
        pos: widget.positionController.text,
        contactNum: widget.contactNumController.text,
      ),
    );
  }

  void clearFields() {
    widget.nameController.clear();
    widget.positionController.clear();
    widget.contactNumController.clear();
  }
}
