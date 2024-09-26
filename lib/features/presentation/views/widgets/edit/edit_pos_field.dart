import 'package:flutter/material.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utls/custom_text_form-field.dart';

class EditPosField extends StatefulWidget {
  const EditPosField({
    super.key,
    required this.positionFocusNode,
    required this.posController,
  });
  final FocusNode positionFocusNode;
  final TextEditingController posController;

  @override
  State<EditPosField> createState() => _EditPosFieldState();
}

class _EditPosFieldState extends State<EditPosField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Position',
      textEditingController:
          widget.posController, // Use the controller passed from the parent
      focusNode: widget.positionFocusNode,
      color: widget.positionFocusNode.hasFocus ? focusColor : defaultColor,
      keyboardType: TextInputType.text,
      prefixIcon: const Icon(
        Icons.work,
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(widget.positionFocusNode);
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    widget.positionFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.positionFocusNode.dispose();
  }
}
