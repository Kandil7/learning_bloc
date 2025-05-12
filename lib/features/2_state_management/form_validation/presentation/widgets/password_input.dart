import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/form_validation_bloc.dart';
import '../bloc/form_validation_event.dart';
import '../bloc/form_validation_state.dart';

/// Widget for password input with validation
class PasswordInput extends StatelessWidget {
  /// Create a new password input widget
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) => 
          previous.password != current.password || 
          previous.isPasswordValid != current.isPasswordValid,
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            context.read<FormValidationBloc>().add(PasswordChanged(value));
          },
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            helperText: 'Must be at least 6 characters',
            errorText: !state.isPasswordValid && state.password.isNotEmpty
                ? 'Password too short'
                : null,
            prefixIcon: const Icon(Icons.lock),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
