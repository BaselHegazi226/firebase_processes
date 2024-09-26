import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/presentation/manager/firebase_bloc/firebase_bloc.dart';
import 'dialog_content.dart';
import 'dialog_title.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
    this.leftText = 'Cancel',
    this.rightText = 'Delete',
    required this.title,
    required this.personName,
    required this.empId,
    required this.icon,
  });

  final String leftText;
  final String rightText;
  final String title;
  final String personName;
  final String empId;
  final Icon icon;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool deleteAll = false;
  IconData iconData = Icons.check_box_outline_blank_rounded;
  IconData disableIconData = Icons.check_box_outline_blank_rounded;
  IconData enableIconData = Icons.check_box_rounded;
  Color enableColor = Colors.red;
  Color disableColor = Colors.white70;
  Color contentColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.icon,
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              scrollable: true,
              elevation: 16,
              shadowColor: Colors.blueGrey,
              backgroundColor: Colors.blueGrey.shade700.withOpacity(.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: contentColor,
                  width: 2,
                ),
              ),
              title: DialogTitle(
                title: widget.title,
                personName: widget.personName,
              ),
              content: DialogContent(
                deleteAll: deleteAll,
                iconData: iconData,
                contentColor: contentColor,
                onToggleDeleteAll: () {
                  setState(() {
                    if (iconData == disableIconData) {
                      enableFun();
                    } else {
                      disableFun();
                    }
                  });
                },
              ),
              actions: buildDialogActions(context),
            ),
          );
        },
      ),
    );
  }

  void enableFun() {
    iconData = enableIconData;
    deleteAll = true;
    contentColor = enableColor;
  }

  void disableFun() {
    iconData = disableIconData;
    deleteAll = false;
    contentColor = disableColor;
  }

  List<Widget> buildDialogActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          GoRouter.of(context).pop();
          disableFun();
        },
        child: Text(
          widget.leftText,
          style: TextStyle(
            color: Colors.white.withOpacity(.4),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          GoRouter.of(context).pop();
          _handleDeleteAction(context);
        },
        child: Text(
          widget.rightText,
          style: TextStyle(
            color: contentColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    ];
  }

  void _handleDeleteAction(BuildContext context) {
    final firebaseBloc = BlocProvider.of<FirebaseBloc>(context);
    if (deleteAll) {
      firebaseBloc.add(DeleteAllEmpEvent());
    } else {
      firebaseBloc.add(DeleteEmpEvent(id: widget.empId));
    }
  }
}
