import 'package:flutter/material.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utls/custom_text_form-field.dart';

class EditNumField extends StatefulWidget {
  const EditNumField({
    super.key,
    required this.nameFocusNode,
    required this.nameController,
  });
  final FocusNode nameFocusNode;
  final TextEditingController nameController;
  @override
  State<EditNumField> createState() => _EditNumFieldState();
}

class _EditNumFieldState extends State<EditNumField> {
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
        FocusScope.of(context).requestFocus(widget.nameFocusNode);
        setState(() {});
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
    super.dispose();
    widget.nameFocusNode.dispose();
  }
}
