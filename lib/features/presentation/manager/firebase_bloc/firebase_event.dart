part of 'firebase_bloc.dart';

abstract class FirebaseEvent {}

class AddEmpEvent extends FirebaseEvent {
  AddEmpEvent({
    required this.name,
    required this.gender,
    required this.image,
    required this.pos,
    required this.contactNum,
  });
  final String name;
  final String? gender;
  final String image;
  final String pos;
  final String contactNum;
}

class UpdateEmpEvent extends FirebaseEvent {
  UpdateEmpEvent({
    required this.id,
    required this.name,
    required this.gender,
    required this.image,
    required this.pos,
    required this.contactNum,
  });
  final String id;
  final String name;
  final String? gender;
  final String image;
  final String pos;
  final String contactNum;
}

class DeleteEmpEvent extends FirebaseEvent {
  DeleteEmpEvent({
    required this.id,
  });
  final String id;
}

class DeleteAllEmpEvent extends FirebaseEvent {}
