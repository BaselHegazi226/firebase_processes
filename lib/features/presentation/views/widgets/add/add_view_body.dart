import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/AssetsData.dart';
import '../../../../../core/helper/constant.dart';
import '../../../../../core/helper/custom_indicator.dart';
import '../../../../../core/helper/custom_show_snack_bar.dart';
import '../../../../../core/utls/button_title.dart';
import '../../../../../core/utls/custom_profile_image.dart';
import '../../../../../core/utls/custom_text_button.dart';
import '../../../manager/firebase_bloc/firebase_bloc.dart';
import 'add_drop_button.dart';
import 'add_fields.dart';

class AddViewBody extends StatefulWidget {
  const AddViewBody({super.key});

  @override
  State<AddViewBody> createState() => _AddViewBodyState();
}

class _AddViewBodyState extends State<AddViewBody> {
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
                image: profileImage,
              ),
              const SizedBox(height: 16),
              AddDropDownButton(
                onChanged: (value) {
                  genderFuc(value);
                },
                gender: gender,
                genderIcon: genderIcon,
                profileImage: profileImage,
              ),
              const SizedBox(height: 16),
              AddFields(
                nameController: nameController,
                nameFocusNode: nameFocusNode,
                posController: posController,
                contactController: contactController,
                posFocusNode: positionFocusNode,
                contactFocusNode: contactFocusNode,
              ),
              const SizedBox(height: 32),
              BlocConsumer<FirebaseBloc, FirebaseState>(
                listener: (context, state) {
                  if (state is AddEmpSuccess) {
                    addEventResult(context);
                  }
                },
                builder: (context, state) {
                  return CustomTextButton(
                    textColor: kButtonTextColor,
                    backgroundColor: (isEnableButton)
                        ? kEnableButtonColor
                        : kDisableButtonColor,
                    shadowColor: kShadowButtonColor,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        addEvent(context);
                      } else {
                        setState(() {
                          autoValidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    child: state is AddEmpLoading
                        ? const CustomIndicator(
                            color: Colors.white,
                          )
                        : const ButtonTitle(text: 'Save'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  final nameController = TextEditingController();
  final posController = TextEditingController();
  final contactController = TextEditingController();

  final nameFocusNode = FocusNode();
  final positionFocusNode = FocusNode();
  final contactFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? gender;
  IconData? genderIcon;
  String profileImage = AssetsData.kImageProfile;
  bool isEnableButton = false;

  @override
  void initState() {
    super.initState();
    controllerListenFun();
    focusFun();
  }

  @override
  void dispose() {
    controllerDisFun();
    focusDisFun();
    super.dispose();
  }

  void controllerListenFun() {
    nameController.addListener(validateInput);
    posController.addListener(validateInput);
    contactController.addListener(validateInput);
  }

  void focusFun() {
    nameFocusNode.addListener(() {
      setState(() {});
    });
    positionFocusNode.addListener(() {
      setState(() {});
    });
    contactFocusNode.addListener(() {
      setState(() {});
    });
  }

  void controllerDisFun() {
    nameController.dispose();
    posController.dispose();
    contactController.dispose();
  }

  void focusDisFun() {
    nameFocusNode.dispose();
    positionFocusNode.dispose();
    contactFocusNode.dispose();
  }

  void validateInput() {
    setState(() {
      isEnableButton = nameController.text.isNotEmpty &&
          posController.text.isNotEmpty &&
          contactController.text.isNotEmpty;
    });
  }

  void genderFuc(String? genderValue) {
    setState(() {
      gender = genderValue;
      if (genderValue == 'Female') {
        profileImage = AssetsData.kFeMaleImage;
        genderIcon = Icons.female_rounded;
      } else if (genderValue == 'Male') {
        profileImage = AssetsData.kMaleImage;
        genderIcon = Icons.male_rounded;
      } else {
        genderIcon = Icons.transgender_rounded;
        profileImage = AssetsData.kImageProfile;
      }
    });
  }

  void onResetFun() {
    setState(() {
      gender = null;
      genderFuc(gender);
      isEnableButton = false;
    });
  }

  void addEventResult(BuildContext context) {
    showSnackBar(context, 'success save');
    onResetFun();
    clearFields();
    setState(() {
      // to return the fields to disable mode
      autoValidateMode = AutovalidateMode.disabled;
    });
  }

  void addEvent(BuildContext context) {
    BlocProvider.of<FirebaseBloc>(context).add(
      AddEmpEvent(
        name: nameController.text,
        gender: gender ?? 'No gender',
        image: profileImage,
        pos: posController.text,
        contactNum: contactController.text,
      ),
    );
  }

  void clearFields() {
    nameController.clear();
    posController.clear();
    contactController.clear();
  }
}
