import 'package:copy_firebase_process/features/data/model/employee_model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utls/app_get_bloc.dart';
import '../../manager/firebase_bloc/firebase_bloc.dart';
import '../widgets/edit/edit_view_body.dart';

class EditView extends StatelessWidget {
  static const id = '/editView';

  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    double keyBoardHeight = MediaQuery.of(context).viewInsets.top;
    EmployeeModel employeeModel =
        GoRouterState.of(context).extra as EmployeeModel;
    return BlocProvider(
      create: (context) => AppGetBloc.getIt.get<FirebaseBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.withOpacity(.7),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Update Employee',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(
              bottom: keyBoardHeight,
            ),
            child: EditViewBody(
              employeeModel: employeeModel,
            ),
          )),
        ),
      ),
    );
  }
}
