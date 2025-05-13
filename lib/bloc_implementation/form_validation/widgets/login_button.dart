import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

/// Login Button Widget
///
/// This widget displays a login button and interacts with the LoginBloc.
class LoginButton extends StatelessWidget {
  /// Creates a new LoginButton instance
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.status != current.status || previous.isValid != current.isValid,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('loginForm_submit_button'),
          onPressed: state.isValid && !state.status.isInProgress
              ? () => context.read<LoginBloc>().add(const FormSubmitted())
              : null,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            state.status.isInProgress ? 'Logging in...' : 'Login',
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }
}
