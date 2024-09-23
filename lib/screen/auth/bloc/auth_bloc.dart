import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ojt_irfan/screen/auth/model/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthRegister>(_onAuthRegister);
  }

  Future<void> _onAuthRegister(
    AuthRegister event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      await Future.delayed(const Duration(seconds: 2));

      final User? userData = await User.addNewUser(
        username: event.name,
        email: event.email,
        password: event.password,
      );

      if (userData != null) {
        emit(AuthSuccess(user: userData));
      } else {
        emit(AuthFailure(message: "Failed to register user"));
      }
    } catch (e) {
      emit(AuthFailure(message: "Unexpected error ocurred: $e"));
    }
  }
}
