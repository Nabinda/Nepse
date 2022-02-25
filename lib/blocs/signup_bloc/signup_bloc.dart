import 'dart:async';
import 'package:nepse/blocs/auth_bloc/auth.dart';
import 'package:nepse/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SignupBloc({
    required this.userRepository,
    required this.authenticationBloc,
  }) : super(SignupInitial()) {
    on<SignupButtonPressed>(onSignupButtonPressed);
  }

  SignupState get initialState => SignupInitial();

  Future<void> onSignupButtonPressed(
      SignupButtonPressed event,
      Emitter<SignupState> emit,
      ) async {
    try {
      emit(SignupLoading());
      final resp = await userRepository.register(
        event.name,
        event.email,
        event.password,
      );
      authenticationBloc.add(SignedUp(token: resp.tokens.access.token ));
      emit(SignupSuccess());
    } catch (e) {
      print(e);
      print(e.toString());
      emit(SignupFailure(error: e.toString()));
    }
  }
}
