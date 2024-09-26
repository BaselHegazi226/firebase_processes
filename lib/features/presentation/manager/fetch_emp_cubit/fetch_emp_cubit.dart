import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/employee_model/employee_model.dart';
import '../../../data/repos/firebase_repo.dart';

part 'fetch_emp_state.dart';

class FetchEmpCubit extends Cubit<FetchEmpState> {
  final FirebaseRepo firebaseRepo;

  FetchEmpCubit({
    required this.firebaseRepo,
  }) : super(FetchEmpInitial());

  // Updated method to handle Stream properly
  Future<void> fetchEmp() async {
    emit(FetchEmpLoading()); // Emit loading state
    print('now loading in cubit');

    try {
      var streamResult = firebaseRepo.fetchEmp();
      await for (var result in streamResult) {
        result.fold(
          (error) {
            emit(FetchEmpFailure(errorMessage: error.toString()));
          },
          (empList) {
            emit(FetchEmpSuccess(empList: empList));
          },
        );
      }
    } catch (e) {
      emit(FetchEmpFailure(errorMessage: e.toString()));
    }
  }
}
