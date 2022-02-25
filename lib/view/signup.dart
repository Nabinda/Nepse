import 'package:nepse/blocs/auth_bloc/auth.dart';
import 'package:nepse/blocs/login_bloc/login_bloc.dart';
import 'package:nepse/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  final UserRepository userRepository;
  static const String routeName = "/signup_screen";
  const SignupScreen({Key? key, required this.userRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: BlocProvider(
            create: (context) {
              return LoginBloc(
                authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context),
                userRepository: userRepository,
              );
            },
            child: SignupForm(
              userRepository: userRepository,
            ),
          ),
        ),
      ),
    );
  }
}
