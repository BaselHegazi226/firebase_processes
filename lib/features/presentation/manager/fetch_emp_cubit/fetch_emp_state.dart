part of 'fetch_emp_cubit.dart';

@immutable
sealed class FetchEmpState {}

final class FetchEmpInitial extends FetchEmpState {}

final class FetchEmpLoading extends FetchEmpState {}

final class FetchEmpSuccess extends FetchEmpState {
  FetchEmpSuccess({
    required this.empList,
  });
  final List<EmployeeModel> empList;
}

final class FetchEmpFailure extends FetchEmpState {
  FetchEmpFailure({
    required this.errorMessage,
  });
  final String errorMessage;
}
