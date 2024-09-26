import 'package:copy_firebase_process/core/utls/shimmer_list.dart';
import 'package:copy_firebase_process/features/data/model/employee_model/employee_model.dart';
import 'package:copy_firebase_process/features/presentation/manager/fetch_emp_cubit/fetch_emp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../edit_view.dart';
import 'emp_view_item.dart';

class EmpList extends StatefulWidget {
  const EmpList({super.key});

  @override
  State<EmpList> createState() => _EmpListState();
}

class _EmpListState extends State<EmpList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Ensure that the cubit is fetched after the context is fully built
    BlocProvider.of<FetchEmpCubit>(context).fetchEmp();
  }

  int empCount = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchEmpCubit, FetchEmpState>(
      builder: (context, state) {
        if (state is FetchEmpFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          );
        } else if (state is FetchEmpSuccess) {
          List<EmployeeModel> list = state.empList;
          empCount = list.length;
          if (list.isEmpty) {
            return const Center(
              child: Text(
                'No Employees. Add an employee.',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return successListState(list);
          }
        } else {
          return ShimmerList(
            length: empCount,
          );
        }
      },
    );
  }

  ListView successListState(List<EmployeeModel> list) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      itemCount: list.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return EmpViewItem(
          employeeModel: list[index],
          editPressed: () {
            GoRouter.of(context).push(
              EditView.id,
              extra: list[index],
            );
            BlocProvider.of<FetchEmpCubit>(context).fetchEmp();
          },
        );
      },
    );
  }
}
