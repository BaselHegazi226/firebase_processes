import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errorMessage;
  Failure({
    required this.errorMessage,
  });
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.errorMessage});

  factory FirebaseFailure.fromFirebaseException(FirebaseException exception) {
    switch (exception.code) {
      case 'network-request-failed':
        return FirebaseFailure(
            errorMessage: 'Network error. Please check your connection.');
      case 'too-many-requests':
        return FirebaseFailure(
            errorMessage: 'Too many requests. Try again later.');
      case 'user-not-found':
        return FirebaseFailure(
            errorMessage: 'User not found. Please check your credentials.');
      case 'wrong-password':
        return FirebaseFailure(
            errorMessage: 'Wrong password. Please try again.');
      case 'email-already-in-use':
        return FirebaseFailure(errorMessage: 'This email is already in use.');
      case 'invalid-email':
        return FirebaseFailure(errorMessage: 'The email address is not valid.');
      case 'weak-password':
        return FirebaseFailure(errorMessage: 'The password is too weak.');
      case 'operation-not-allowed':
        return FirebaseFailure(errorMessage: 'This operation is not allowed.');
      case 'user-disabled':
        return FirebaseFailure(
            errorMessage: 'This user account has been disabled.');
      case 'requires-recent-login':
        return FirebaseFailure(
            errorMessage: 'Please log in again to perform this action.');
      case 'invalid-verification-code':
        return FirebaseFailure(
            errorMessage: 'The verification code is invalid.');
      case 'invalid-verification-id':
        return FirebaseFailure(errorMessage: 'The verification ID is invalid.');
      default:
        return FirebaseFailure(
            errorMessage: 'An unknown error occurred. Please try again.');
    }
  }

  factory FirebaseFailure.fromFirebaseAuthException(
      FirebaseAuthException exception) {
    switch (exception.code) {
      case 'user-not-found':
        return FirebaseFailure(
            errorMessage: 'No user found with these credentials.');
      case 'wrong-password':
        return FirebaseFailure(errorMessage: 'Incorrect password.');
      case 'account-exists-with-different-credential':
        return FirebaseFailure(
            errorMessage: 'Account exists with different credentials.');
      case 'invalid-credential':
        return FirebaseFailure(errorMessage: 'Invalid credentials.');
      case 'user-disabled':
        return FirebaseFailure(errorMessage: 'This user has been disabled.');
      case 'operation-not-allowed':
        return FirebaseFailure(errorMessage: 'Operation not allowed.');
      case 'invalid-email':
        return FirebaseFailure(errorMessage: 'Invalid email address.');
      default:
        return FirebaseFailure(errorMessage: 'Authentication error occurred.');
    }
  }
}
