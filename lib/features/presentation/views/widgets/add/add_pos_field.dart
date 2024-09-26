import 'package:flutter/material.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utls/custom_text_form-field.dart';

class AddPosField extends StatefulWidget {
  const AddPosField({
    super.key,
    required this.positionFocusNode,
    required this.posController,
  });
  final TextEditingController posController;
  final FocusNode positionFocusNode;
  @override
  State<AddPosField> createState() => _AddPosFieldState();
}

class _AddPosFieldState extends State<AddPosField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Position',
      textEditingController: widget.posController,
      focusNode: widget.positionFocusNode,
      color: widget.positionFocusNode.hasFocus ? focusColor : defaultColor,
      keyboardType: TextInputType.text,
      prefixIcon: const Icon(Icons.work),
      onTap: () {
        FocusScope.of(context).requestFocus(
          widget.positionFocusNode,
        );
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
