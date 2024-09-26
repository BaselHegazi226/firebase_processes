import 'package:copy_firebase_process/core/helper/button_title.dart';
import 'package:copy_firebase_process/core/helper/constant.dart';
import 'package:copy_firebase_process/core/helper/custom_indicator.dart';
import 'package:copy_firebase_process/features/presentation/manager/firebase_bloc/firebase_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/custom_show_snack_bar.dart';
import '../../../../../core/utls/custom_text_button.dart';
import '../../../../data/model/employee_model/employee_model.dart';

class EditButton extends StatefulWidget {
  const EditButton({
    super.key,
    required this.formKey,
    required this.gender,
    required this.profileImage,
    required this.nameController,
    required this.positionController,
    required this.contactNumController,
    required this.employeeModel,
    required this.autoValidateMode,
    required this.isEnableButton,
  });
  final GlobalKey<FormState> formKey;
  final String? gender, profileImage;
  final TextEditingController nameController,
      positionController,
      contactNumController;
  final AutovalidateMode autoValidateMode;
  final EmployeeModel employeeModel;
  final bool isEnableButton;
  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  AutovalidateMode? autoValidateMode;
  @override
  Widget build(BuildContext context) {
    autoValidateMode = widget.autoValidateMode;
    return BlocConsumer<FirebaseBloc, FirebaseState>(
        listener: (context, state) {
      if (state is UpdateEmpSuccess) {
        showSnackBar(context, 'Success Update');
      }
    }, builder: (context, state) {
      return CustomTextButton(
        textColor: kButtonTextColor,
        backgroundColor:
            (widget.isEnableButton) ? kEnableButtonColor : kDisableButtonColor,
        shadowColor: kShadowButtonColor,
        onPressed: () async {
          if (widget.formKey.currentState!.validate()) {
            updateEvent(context);
            FocusScope.of(context).unfocus();
          } else {
            autoValidateMode = AutovalidateMode.always;
          }
        },
        child: (state is UpdateEmpLoading)
            ? const CustomIndicator(
                color: Colors.white,
              )
            : const ButtonTitle(text: 'Update'),
      );
    });
  }

  void updateEvent(BuildContext context) {
    BlocProvider.of<FirebaseBloc>(context).add(
      UpdateEmpEvent(
        gender: widget.gender, // Update gender value
        image: widget.profileImage!,
        id: widget.employeeModel.id,
        name: widget.nameController.text,
        pos: widget.positionController.text,
        contactNum: widget.contactNumController.text,
      ),
    );
  }
}
