import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../models/form_input.dart';

/// Password Input Widget
///
/// This widget displays a password input field and interacts with the LoginBloc.
class PasswordInput extends StatefulWidget {
  /// Creates a new PasswordInput instance
  const PasswordInput({Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(PasswordChanged(password)),
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: 'Password',
            helperText: 'Password must be at least 8 characters',
            errorText: state.password.displayError != null
                ? _getErrorText(state.password.error)
                : null,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }

  String _getErrorText(PasswordValidationError? error) {
    switch (error) {
      case PasswordValidationError.empty:
        return 'Password cannot be empty';
      case PasswordValidationError.tooShort:
        return 'Password must be at least 8 characters';
      default:
        return '';
    }
  }
}
