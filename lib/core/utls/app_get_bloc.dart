import 'package:copy_firebase_process/features/data/repos/firebase_repo_impl.dart';
import 'package:copy_firebase_process/features/presentation/manager/fetch_emp_cubit/fetch_emp_cubit.dart';
import 'package:copy_firebase_process/features/presentation/manager/firebase_bloc/firebase_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class AppGetBloc {
  static final getIt = GetIt.instance;

  static void setUp() {
    // Register singleton for FirebaseRepoImpl, as it will be reused
    getIt.registerSingleton<FirebaseRepoImpl>(
      FirebaseRepoImpl(),
    );

    // Register factory for FirebaseBloc, so a new instance is created each time
    getIt.registerFactory<FirebaseBloc>(
      () => FirebaseBloc(
        firebaseRepo: getIt.get<FirebaseRepoImpl>(),
      ),
    );

    // Register factory for FetchEmpCubit
    getIt.registerFactory<FetchEmpCubit>(
      () => FetchEmpCubit(
        firebaseRepo: getIt.get<FirebaseRepoImpl>(),
      ),
    );
  }
}
