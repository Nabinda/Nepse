import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class SignedUp extends AuthenticationEvent {
  final String token;

  const SignedUp({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'SignedUp { token: $token }';
}

class LoggedOut extends AuthenticationEvent {}
