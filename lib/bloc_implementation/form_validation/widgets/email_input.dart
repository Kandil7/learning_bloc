import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../models/form_input.dart';

/// Email Input Widget
///
/// This widget displays an email input field and interacts with the LoginBloc.
class EmailInput extends StatelessWidget {
  /// Creates a new EmailInput instance
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<LoginBloc>().add(EmailChanged(email)),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            helperText: 'A valid email e.g. test@example.com',
            errorText: state.email.displayError != null
                ? _getErrorText(state.email.error)
                : null,
            prefixIcon: const Icon(Icons.email),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }

  String _getErrorText(EmailValidationError? error) {
    switch (error) {
      case EmailValidationError.empty:
        return 'Email cannot be empty';
      case EmailValidationError.invalid:
        return 'Please enter a valid email';
      default:
        return '';
    }
  }
}
