import 'package:flutter/material.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utls/custom_text_form-field.dart';

class AddFields extends StatelessWidget {
  const AddFields(
      {super.key,
      required this.nameController,
      required this.nameFocusNode,
      required this.posController,
      required this.contactController,
      required this.posFocusNode,
      required this.contactFocusNode});
  final TextEditingController nameController, posController, contactController;
  final FocusNode nameFocusNode, posFocusNode, contactFocusNode;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Name',
          textEditingController: nameController,
          focusNode: nameFocusNode,
          color: nameFocusNode.hasFocus ? focusColor : defaultColor,
          keyboardType: TextInputType.text,
          prefixIcon: const Icon(
            Icons.person_rounded,
          ),
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hintText: 'Position',
          textEditingController: posController,
          focusNode: posFocusNode,
          color: posFocusNode.hasFocus ? focusColor : defaultColor,
          keyboardType: TextInputType.text,
          prefixIcon: const Icon(Icons.work),
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hintText: 'Contact Number',
          textEditingController: contactController,
          color: contactFocusNode.hasFocus ? focusColor : defaultColor,
          focusNode: contactFocusNode,
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(
            Icons.phone,
          ),
        ),
      ],
    );
  }
}
