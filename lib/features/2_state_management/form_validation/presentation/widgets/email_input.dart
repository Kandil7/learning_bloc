import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/form_validation_bloc.dart';
import '../bloc/form_validation_event.dart';
import '../bloc/form_validation_state.dart';

/// Widget for email input with validation
class EmailInput extends StatelessWidget {
  /// Create a new email input widget
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) => 
          previous.email != current.email || 
          previous.isEmailValid != current.isEmailValid,
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            context.read<FormValidationBloc>().add(EmailChanged(value));
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            helperText: 'Must contain @ and . characters',
            errorText: !state.isEmailValid && state.email.isNotEmpty
                ? 'Invalid email format'
                : null,
            prefixIcon: const Icon(Icons.email),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
