part of 'firebase_bloc.dart';

abstract class FirebaseState {}

final class FirebaseInitial extends FirebaseState {}

//add states
class AddEmpInitial extends FirebaseState {}

class AddEmpLoading extends FirebaseState {}

class AddEmpSuccess extends FirebaseState {}

class AddEmpFailure extends FirebaseState {
  final String errorMessage;
  AddEmpFailure({
    required this.errorMessage,
  });
}

//update states
class UpdateEmpInitial extends FirebaseState {}

class UpdateEmpLoading extends FirebaseState {}

class UpdateEmpSuccess extends FirebaseState {}

class UpdateEmpFailure extends FirebaseState {
  final String errorMessage;
  UpdateEmpFailure({
    required this.errorMessage,
  });
}

//delete states
class DeleteEmpInitial extends FirebaseState {}

class DeleteEmpLoading extends FirebaseState {}

class DeleteEmpSuccess extends FirebaseState {}

class DeleteEmpFailure extends FirebaseState {
  final String errorMessage;
  DeleteEmpFailure({
    required this.errorMessage,
  });
}

//delete all states
class DeleteAllEmpInitial extends FirebaseState {}

class DeleteAllEmpLoading extends FirebaseState {}

class DeleteAllEmpSuccess extends FirebaseState {}

class DeleteAllEmpFailure extends FirebaseState {
  final String errorMessage;
  DeleteAllEmpFailure({
    required this.errorMessage,
  });
}
