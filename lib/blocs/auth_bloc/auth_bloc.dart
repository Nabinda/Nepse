import 'dart:async';
import 'package:nepse/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationUninitialized()) {
    on<AppStarted>(onAppStarted);
    on<LoggedIn>(onLoggedIn);
    on<LoggedOut>(onLoggedOut);
  }

  AuthenticationState get initialState => AuthenticationUninitialized();

  Future<void> onAppStarted(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final bool hasToken = await userRepository.hasToken();
    if (hasToken) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  void onLoggedIn(
    LoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    await userRepository.persistToken(event.token);
    emit(AuthenticationAuthenticated());
  }

  Future<void> onLoggedOut(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    await userRepository.deleteToken();
    emit(AuthenticationUnauthenticated());
  }
}
