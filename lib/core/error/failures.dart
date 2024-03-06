import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class FirebaseFailure extends Failure {
  FirebaseFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
