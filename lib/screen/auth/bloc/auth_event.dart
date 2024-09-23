part of 'auth_bloc.dart';

@immutable
class AuthEvent {}

class AuthRegister extends AuthEvent {
  final String name;
  final String email;
  final String password;

  AuthRegister({
    required this.name,
    required this.email,
    required this.password,
  });
}
