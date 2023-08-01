part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  final String uid;

  // ignore: prefer_const_constructors_in_immutables
  AuthenticatedState({required this.uid});

  @override
  List<Object> get props => [uid];
}

class UnAuthenticatedState extends AuthState {
  @override
  List<Object> get props => [];
}
