import 'package:flutter/material.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utls/custom_text_form-field.dart';

class AddContactField extends StatefulWidget {
  const AddContactField({
    super.key,
    required this.contactFocusNode,
    required this.contactController,
  });
  final TextEditingController contactController;
  final FocusNode contactFocusNode;
  @override
  State<AddContactField> createState() => _AddContactFieldState();
}

class _AddContactFieldState extends State<AddContactField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Contact Number',
      textEditingController: widget.contactController,
      color: widget.contactFocusNode.hasFocus ? focusColor : defaultColor,
      focusNode: widget.contactFocusNode,
      keyboardType: TextInputType.phone,
      prefixIcon: const Icon(
        Icons.phone,
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(
          widget.contactFocusNode,
        );
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
