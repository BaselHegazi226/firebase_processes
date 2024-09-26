import 'package:copy_firebase_process/features/presentation/views/widgets/emp/emp_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utls/app_get_bloc.dart';
import '../manager/fetch_emp_cubit/fetch_emp_cubit.dart';
import '../manager/firebase_bloc/firebase_bloc.dart';

class EmpView extends StatelessWidget {
  const EmpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.withOpacity(.7),
        title: const Text(
          'Employee view',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AppGetBloc.getIt.get<FirebaseBloc>(),
            ),
            BlocProvider(
              create: (context) => AppGetBloc.getIt.get<FetchEmpCubit>(),
            ),
          ],
          child: const EmpList(),
        ),
      ),
    );
  }
}
