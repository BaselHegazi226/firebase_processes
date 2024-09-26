import 'package:copy_firebase_process/core/utls/custom_drop_down_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/AssetsData.dart';
import '../../../../../core/utls/custom_profile_image.dart';
import '../../../../data/model/employee_model/employee_model.dart';
import 'edit_button.dart';
import 'edit_fields.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({
    super.key,
    required this.employeeModel,
  });
  final EmployeeModel employeeModel;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  late TextEditingController nameController;
  late TextEditingController posController;
  late TextEditingController contactController;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode positionFocusNode = FocusNode();
  final FocusNode contactFocusNode = FocusNode();

  final Color focusColor = Colors.blueGrey;
  final Color defaultColor = Colors.grey;
  String? gender;
  late IconData genderIcon;
  String? profileImage;
  bool isEnableButton = false;
  bool isChangeGender = false;

  @override
  void initState() {
    super.initState();
    gender = widget.employeeModel.gender;
    genderFun(gender);
    controller();
    nameController.addListener(validateInput);
    posController.addListener(validateInput);
    contactController.addListener(validateInput);
  }

  @override
  void dispose() {
    nameController.dispose();
    posController.dispose();
    contactController.dispose();
    super.dispose();
  }

  void validateInput() {
    setState(() {
      isEnableButton = nameController.text.isNotEmpty ||
          posController.text.isNotEmpty ||
          contactController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomProfileImage(
                radius: 120,
                image: profileImage ?? AssetsData.kImageProfile,
              ),
              CustomDropDownButton(
                selectedItem: gender,
                onChanged: (newValue) {
                  gender = newValue;
                  isChangeGender = true;
                  genderFun(gender);
                },
                genderIcon: genderIcon,
              ),
              const SizedBox(
                height: 16,
              ),
              EditFields(
                nameFocusNode: nameFocusNode,
                positionFocusNode: positionFocusNode,
                contactFocusNode: contactFocusNode,
                nameController: nameController,
                posController: posController,
                contactNumController: contactController,
              ),
              const SizedBox(height: 32),
              EditButton(
                isEnableButton: isEnableButton || isChangeGender,
                formKey: formKey,
                nameController: nameController,
                positionController: posController,
                contactNumController: contactController,
                employeeModel: widget.employeeModel,
                autoValidateMode: autoValidateMode,
                gender: gender,
                profileImage: profileImage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void controller() {
    nameController = TextEditingController(
      text: widget.employeeModel.name,
    );
    contactController = TextEditingController(
      text: widget.employeeModel.contactNum,
    );
    posController = TextEditingController(
      text: widget.employeeModel.position,
    );
  }

  void genderFun(String? gender) {
    if (gender == 'Male') {
      genderIcon = Icons.male_rounded;
      profileImage = AssetsData.kMaleImage;
    } else if (gender == 'Female') {
      genderIcon = Icons.female_rounded;
      profileImage = AssetsData.kFeMaleImage;
    } else {
      genderIcon = Icons.transgender_rounded; // Default icon for "No Gender"
      profileImage = AssetsData.kImageProfile;
      gender = 'No Gender'; // Set default value if no gender is selected
    }
  }
}
