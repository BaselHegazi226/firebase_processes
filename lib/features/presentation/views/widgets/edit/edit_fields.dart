import 'package:flutter/material.dart';

import 'edit_contact_field.dart';
import 'edit_name_field.dart';
import 'edit_pos_field.dart';

class EditFields extends StatelessWidget {
  const EditFields({
    super.key,
    required this.nameFocusNode,
    required this.positionFocusNode,
    required this.contactFocusNode,
    required this.nameController,
    required this.posController,
    required this.contactNumController,
  });
  final FocusNode nameFocusNode;
  final FocusNode positionFocusNode;
  final FocusNode contactFocusNode;
  final TextEditingController nameController;
  final TextEditingController posController;
  final TextEditingController contactNumController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditNumField(
          nameFocusNode: nameFocusNode,
          nameController: nameController,
        ),
        const SizedBox(height: 16),
        EditPosField(
          positionFocusNode: positionFocusNode,
          posController: posController,
        ),
        const SizedBox(height: 16),
        EditContactField(
          contactFocusNode: contactFocusNode,
          contactNumController: contactNumController,
        ),
      ],
    );
  }
}
