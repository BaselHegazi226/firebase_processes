import 'package:flutter/material.dart';

import '../../../../../core/utls/icon_and_text.dart';
import '../../../../data/model/employee_model/employee_model.dart';

class EmpData extends StatelessWidget {
  const EmpData({
    super.key,
    required this.employeeModel,
  });
  final EmployeeModel employeeModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconAndText(
          textColor: Colors.blueGrey.shade600,
          iconColor: Colors.blueGrey.shade600,
          iconData: Icons.person,
          text: employeeModel.name,
          fontSize: 20,
        ),
        IconAndText(
          textColor: Colors.blueGrey,
          iconColor: Colors.blueGrey,
          iconData: Icons.work,
          text: employeeModel.position,
          fontSize: 18,
        ),
        IconAndText(
          textColor: Colors.blueGrey.shade500,
          iconColor: Colors.blueGrey.shade500,
          iconData: Icons.phone,
          text: employeeModel.contactNum,
          fontSize: 18,
        ),
      ],
    );
  }
}
