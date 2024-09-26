import 'package:flutter/material.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utls/custom_text_form-field.dart';

class AddNameField extends StatefulWidget {
  const AddNameField({
    super.key,
    required this.nameController,
    required this.nameFocusNode,
  });
  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  @override
  State<AddNameField> createState() => _AddNameFieldState();
}

class _AddNameFieldState extends State<AddNameField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Name',
      textEditingController: widget.nameController,
      focusNode: widget.nameFocusNode,
      color: widget.nameFocusNode.hasFocus ? focusColor : defaultColor,
      keyboardType: TextInputType.text,
      prefixIcon: const Icon(
        Icons.person_rounded,
      ),
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(
            widget.nameFocusNode,
          );
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    widget.nameFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.nameFocusNode.dispose();
    super.dispose();
  }
}
