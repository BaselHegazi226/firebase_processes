import 'package:copy_firebase_process/features/data/model/employee_model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utls/custom_dialog.dart';
import '../../../../../core/utls/custom_profile_image.dart';
import '../../views/edit_view.dart';
import '../edit/edit_Icon.dart';
import 'emp_data.dart';
import 'emp_data_decor.dart';

class EmpViewItem extends StatelessWidget {
  const EmpViewItem({
    super.key,
    required this.employeeModel,
    required this.editPressed,
  });
  final EmployeeModel employeeModel;
  final void Function()? editPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomProfileImage(
            radius: 30,
            image: employeeModel.image,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                EditView.id,
                extra: employeeModel,
              );
            },
            child: EmpDataDecor(
              color: Colors.white70,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EmpData(
                    employeeModel: employeeModel,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EditIcon(
                        editPressed: editPressed,
                      ),
                      CustomDialog(
                        icon: Icon(
                          Icons.delete_rounded,
                          size: 40,
                          color: kDisableButtonColor,
                        ),
                        leftText: 'Cancel',
                        rightText: 'Delete',
                        title: 'Do you want to delete ',
                        personName: employeeModel.name,
                        empId: employeeModel.id,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
