import 'package:copy_firebase_process/features/data/repos/firebase_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  final FirebaseRepo firebaseRepo;

  FirebaseBloc({
    required this.firebaseRepo,
  }) : super(FirebaseInitial()) {
    on<AddEmpEvent>(_addEmpEvent);
    on<UpdateEmpEvent>(_updateEmpEvent);
    on<DeleteEmpEvent>(_deleteEmpEvent);
    on<DeleteAllEmpEvent>(_deleteAllEmpEvent);
  }
  Future<void> _addEmpEvent(
      AddEmpEvent event, Emitter<FirebaseState> emit) async {
    emit(AddEmpLoading());
    var result = await firebaseRepo.addEmp(
      name: event.name,
      gender: event.gender ?? 'No gender',
      image: event.image,
      pos: event.pos,
      contactNum: event.contactNum,
    );
    result.fold(((error) {
      emit(AddEmpFailure(errorMessage: error.toString()));
    }), (success) {
      emit(AddEmpSuccess());
    });
  }

  Future<void> _updateEmpEvent(
      UpdateEmpEvent event, Emitter<FirebaseState> emit) async {
    emit(UpdateEmpLoading());
    var result = await firebaseRepo.updateEmp(
      id: event.id,
      name: event.name,
      gender: event.gender ?? 'No gender',
      image: event.image,
      pos: event.pos,
      contactNum: event.contactNum,
    );
    result.fold(((error) {
      emit(UpdateEmpFailure(errorMessage: error.toString()));
    }), (success) {
      emit(UpdateEmpSuccess());
    });
  }

  Future<void> _deleteEmpEvent(
      DeleteEmpEvent event, Emitter<FirebaseState> emit) async {
    emit(DeleteEmpLoading());
    var result = await firebaseRepo.deleteEmp(id: event.id);
    result.fold(((error) {
      emit(DeleteEmpFailure(errorMessage: error.toString()));
    }), (success) {
      emit(DeleteEmpSuccess());
    });
  }

  Future<void> _deleteAllEmpEvent(
      DeleteAllEmpEvent event, Emitter<FirebaseState> emit) async {
    emit(DeleteAllEmpLoading());
    var result = await firebaseRepo.deleteAllEmp();
    result.fold((error) {
      emit(DeleteEmpFailure(errorMessage: error.toString()));
    }, (success) {
      emit(DeleteAllEmpSuccess());
    });
  }
}
