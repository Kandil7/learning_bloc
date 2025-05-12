import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/form_validation_bloc.dart';
import '../bloc/form_validation_event.dart';
import '../bloc/form_validation_state.dart';

/// Widget for the form submit button
class SubmitButton extends StatelessWidget {
  /// Create a new submit button widget
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) => 
          previous.isFormValid != current.isFormValid || 
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.isFormValid && !state.isSubmitting
              ? () {
                  context.read<FormValidationBloc>().add(FormSubmitted());
                }
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text('SUBMIT'),
        );
      },
    );
  }
}
