import 'dart:async';
import 'package:nepse/blocs/auth_bloc/auth.dart';
import 'package:nepse/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  }) : super(LoginInitial()) {
    on<LoginButtonPressed>(onLoginButtonPressed);
  }

  LoginState get initialState => LoginInitial();

  Future<void> onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginLoading());
      final resp = await userRepository.login(
        event.email,
        event.password,
      );
      authenticationBloc.add(LoggedIn(token: resp.tokens.access.token ));
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
