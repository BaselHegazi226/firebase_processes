import 'package:copy_firebase_process/features/data/model/employee_model/employee_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class FirebaseRepo {
  Future<Either<Failure, void>> addEmp({
    required String name,
    required String? gender,
    required String image,
    required String pos,
    required String contactNum,
  });
  Future<Either<Failure, void>> updateEmp({
    required String id,
    required String name,
    required String gender,
    required String image,
    required String pos,
    required String contactNum,
  });
  Future<Either<Failure, void>> deleteEmp({
    required String id,
  });
  Future<Either<Failure, void>> deleteAllEmp();
  Stream<Either<Failure, List<EmployeeModel>>> fetchEmp();
}
