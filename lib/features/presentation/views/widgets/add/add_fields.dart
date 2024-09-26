import 'package:flutter/material.dart';

import 'add_contact_field.dart';
import 'add_name_field.dart';
import 'add_pos_field.dart';

class AddFields extends StatelessWidget {
  const AddFields({
    super.key,
    required this.nameController,
    required this.posController,
    required this.contactController,
    required this.nameFocusNode,
    required this.positionFocusNode,
    required this.contactFocusNode,
  });
  final TextEditingController nameController;
  final TextEditingController posController;
  final TextEditingController contactController;
  final FocusNode nameFocusNode;
  final FocusNode positionFocusNode;
  final FocusNode contactFocusNode;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddNameField(
          nameController: nameController,
          nameFocusNode: nameFocusNode,
        ),
        const SizedBox(height: 16),
        AddPosField(
          positionFocusNode: positionFocusNode,
          posController: posController,
        ),
        const SizedBox(height: 16),
        AddContactField(
          contactFocusNode: contactFocusNode,
          contactController: contactController,
        ),
      ],
    );
  }
}
