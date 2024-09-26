import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_firebase_process/features/data/model/employee_model/employee_model.dart';
import 'package:copy_firebase_process/features/data/repos/services.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import 'firebase_repo.dart';

class FirebaseRepoImpl implements FirebaseRepo {
  @override
  Future<Either<Failure, void>> addEmp({
    required String name,
    required String? gender,
    required String image,
    required String pos,
    required String contactNum,
  }) async {
    try {
      await Services.addEmp(
        name: name,
        gender: gender,
        image: image,
        position: pos,
        contactNum: contactNum,
      );
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteEmp({required String id}) async {
    try {
      await Services.deleteEmp(id: id);
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateEmp({
    required String id,
    required String name,
    required String gender,
    required String image,
    required String pos,
    required String contactNum,
  }) async {
    try {
      await Services.updateEmp(
        id: id,
        name: name,
        gender: gender,
        image: image,
        position: pos,
        contactNum: contactNum,
      );
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Stream<Either<FirebaseFailure, List<EmployeeModel>>> fetchEmp() async* {
    try {
      Stream<QuerySnapshot<Object?>> snapshot = Services.fetchEmp();

      await for (var items in snapshot) {
        List<EmployeeModel> list = [];
        for (var doc in items.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          list.add(EmployeeModel.fromJson(data));
        }
        yield right(list);
      }
    } on FirebaseException catch (e) {
      yield left(FirebaseFailure(errorMessage: e.toString()));
      print('firebase error : $e');
    } catch (e) {
      yield left(FirebaseFailure(errorMessage: e.toString()));
      print('catch error : $e');
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllEmp() async {
    try {
      Services.deleteAllEmp();
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }
}
