import 'package:flutter/material.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utls/custom_text_form-field.dart';

class EditContactField extends StatefulWidget {
  const EditContactField({
    super.key,
    required this.contactFocusNode,
    required this.contactNumController,
  });

  final FocusNode contactFocusNode;
  final TextEditingController contactNumController;

  @override
  State<EditContactField> createState() => _EditContactFieldState();
}

class _EditContactFieldState extends State<EditContactField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Contact Number',
      textEditingController: widget
          .contactNumController, // Use the controller passed from the parent
      color: widget.contactFocusNode.hasFocus ? focusColor : defaultColor,
      focusNode: widget.contactFocusNode,
      keyboardType: TextInputType.text,
      prefixIcon: const Icon(
        Icons.phone,
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(widget.contactFocusNode);
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    widget.contactFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.contactFocusNode.dispose();
  }
}
